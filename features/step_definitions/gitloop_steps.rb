# -----------
# Setup :
# -----------



# -----------
# Tests :
# -----------


# Usage :
#   Then HEAD starts with a059392

Then 'HEAD starts with $sha_start' do |sha_start|
  in_current_dir do
    `git rev-parse HEAD`.should match(/^#{sha_start}/)
  end
end


# Usage :
#   Then the git log graph is:
#     """
#     * 4d72f8a c3
#     * 8aab2de c2
#     * 91182df c1
#     """

Then 'the git log graph is:' do |expected_output|
  the_git_log_graph.should == expected_output
end


# Usage :
#   Then the git log graph matches:
#     """
#     * <a_sha> c3
#     * 8aab2de c2
#     * 91182df c1
#     """

Then 'the git log graph matches:' do |raw_expected_output|
  the_git_log_graph.should match(make_smart_regexp(raw_expected_output))
end
