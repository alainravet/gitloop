
# Setup :
#########



# Test :
#########

Then 'the git status is empty' do
  untracked_or_uncommited_changes.chomp.should be_empty
end

Then 'the git status is:' do |text|
  untracked_or_uncommited_changes.chomp.should == text
end


Then 'the current branch is "$branch"' do |branch|
  the_current_branch.should == "* #{branch}"
end
