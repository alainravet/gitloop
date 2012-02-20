def the_current_branch
  in_current_dir do
    `git branch | grep "*"`.chomp
  end
end


GIT_LOG_GRAPH_COMMAND = "git log --oneline --graph"

def the_git_log_graph
  step %Q{I run `#{GIT_LOG_GRAPH_COMMAND}`} # runs the actual process
  output_from(GIT_LOG_GRAPH_COMMAND).chomp  # only accesses the previous processes outputs
end


def untracked_or_uncommited_changes
  in_current_dir do
    `git status -s`
  end
end

