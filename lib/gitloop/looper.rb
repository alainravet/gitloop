require 'open3'
require File.dirname(__FILE__) + '/git_utils'

module Gitloop

  class Looper
    extend GitUtils

    def self.make_loop_for_references_or_messages(from, to, message=nil)
      from_ref, to_ref = convert_messages_to_git_refs(from, to)
      validate_commits_refs_sequence! from_ref, to_ref

      build_the_loop(from_ref, message, to_ref)
    end

  private

    def self.build_the_loop(from_ref, message, to_ref)
      curr_branch = current_branch()

      call_git "co #{from_ref}^ --quiet"

      msg = message || "loop #{from_ref}..#{to_ref}"
      call_git "merge --no-ff #{to_ref} -m \"*** #{msg}\""

      merge_top = call_git "rev-parse HEAD"
      call_git "co  --quiet #{curr_branch}"
      call_git "rebase #{merge_top}"
    end

    def self.convert_messages_to_git_refs(from, to)
      from_ref = valid_commits_reference?(from) ? from : shas_for_messages_that_match(from).last
      to_ref   = valid_commits_reference?(to  ) ? to   : shas_for_messages_that_match(to  ).last
      [from_ref, to_ref]
    end

    def self.call_git(command, error_message_prefix=nil)
      output, error, status = Open3.capture3("git #{command}")
      if error.empty?
        output
      else
        raise Gitloop::GitError.new [error_message_prefix,error].compact.join("\n")
      end
    end

    def self.validate_commits_refs_sequence!(first_sha, second_sha)
      if invalid_commits_sequence?(first_sha, second_sha)
        error_msg = "#{first_sha}..#{second_sha} is an invalid SHAs sequence"
        raise Gitloop::GitError.new(error_msg)
      end
    end

  end
end
