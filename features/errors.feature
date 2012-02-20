Feature: Errors detection and handling

  As a          developer
  In order to   improve my git history structure
  I want to     create a few loops via git merge and git rebase


  Background:
    Given the sandbox is setup
    Given I cd to "sandbox"


  Scenario Outline: in Ruby, create a loop from the exact SHAs


    When I run `git-loop <from_ref> <to_ref> -m "fail"`

    Then the repo is in its original state
     And there are no unstaged nor staged changes
     And the current branch is "master"

    Scenarios: invalid or unknown SHAs
      | from_ref  | to_ref  |
      | 91182df   | a059392 |
      | 1111111   | a059392 |

    Scenarios: wrong order
      | from_ref  | to_ref  |
      | a059392   | 8aab2de |
