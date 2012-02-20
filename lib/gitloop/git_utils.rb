module Gitloop

  module GitUtils

    def current_branch
      branch = `git branch | grep "*"`
      branch.empty? ?
        nil :
        branch[2..-2] # remove the current branch marker : '* '
    end


    def invalid_commits_sequence?(first_sha, second_sha)
      output = (first_sha == second_sha) ?
        call_git("show #{first_sha}") :
        call_git("show #{first_sha}..#{second_sha}")
      error = !output.start_with?('commit')
    end

    def valid_commits_reference?(reference)
      call_git("show #{reference}").start_with?('commit')
    rescue Gitloop::GitError
      false
    end


    def shas_for_messages_that_match(from_grep)
      onelines = (`git log --oneline --grep "#{from_grep}"`).split("\n")
      shas = onelines.collect { |l| l[/\w+/] }
    end

  end
end