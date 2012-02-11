
# Setup :
#########

Given /^I cleared the sandbox directory$/ do
  in_current_dir do
    FileUtils.rm_rf("sandbox")
  end
end

SANDBOX_PATH = {
  :default    => FIXTURES_PATH + '/sandbox.zip',
  :staged     => FIXTURES_PATH + '/sandbox-with-staged-changes.zip',
  :unstaged   => FIXTURES_PATH + '/sandbox-with-unstaged-changes.zip'
}

Given /^the sandbox is setup$/ do
  step %Q{I cleared the sandbox directory}
  step %Q{I unzip the clean git repo in the sandbox}
end


Given /^I unzip the (.*) in the sandbox$/ do |repository|
  path = case repository
    when 'clean git repo'                   then SANDBOX_PATH[:default ]
    when 'git repo with staged changes'     then SANDBOX_PATH[:staged  ]
    when 'git repo with unstaged changes'   then SANDBOX_PATH[:unstaged]
      else raise "NOT SUPPORTED repository : #{repository.inspect}"
  end
  record_time_taken("unzip") do
    in_current_dir do `unzip #{path}` end           # 0.5 seconds
   #step %(I successfully run `unzip #{path}`)      # 2.3 seconds
  end
end


# Test :
#########

Then /^there are (.*)$/ do |outcome|
  case outcome
    when 'no unstaged nor staged changes'
      untracked_or_uncommited_changes.should be_empty
    when 'untracked or uncommited changes'
      untracked_or_uncommited_changes.should_not be_empty
    else
      raise "BUG : unsupported outcome #{outcome}"
  end
end


CLEAN_REPO_LOG =<<TEXT.chomp
* edadbb7 c6
* da55377 c5 five - fifth commit
* 6fddd9c c4 not the third commit
* bab916a c3 the third commit
* 7355c79 c2 the second commit
* 91182df c1
TEXT

Then /^the (?:clean repo|repo) is in its original state$/ do
  the_git_log_graph.should == CLEAN_REPO_LOG
end