Feature: Happy path (no problems, no edge case)

  As a          developer
  In order to   improve my git history structure
  I want to     create a few loops via git merge and git rebase


  Background:
    Given the sandbox is setup
    Given I cd to "sandbox"

#--------------------------------------------------------------------------------

  Scenario Outline: the many ways to create the same loop


    When I run `<command>`

    Then the git log graph matches:
       """
       * <a_sha> c6
       * <a_sha> c5 five - fifth commit
       *   <a_sha> *** hellboy was here
       |\
       | * 6fddd9c c4 not the third commit
       | * bab916a c3 the third commit
       | * 7355c79 c2 the second commit
       |/
       * 91182df c1
       """
    And the current branch is "master"

    Scenarios: pure SHAs or pure messages snippets
      |                           command                      |
      | git-loop 7355c79 6fddd9c   -m "hellboy was here"       |
      | git-loop master~4 master~2 -m "hellboy was here"       |
      | git-loop "c2"  "c4" -m "hellboy was here"              |
      | git-loop "second commit" 6fddd9c -m "hellboy was here" |


#--------------------------------------------------------------------------------

  Scenario: comment can contain quote
    When I run `git-loop 7355c79 6fddd9c   -m "let's do it"`

    Then the current branch is "master"
     And the git log graph matches:
       """
       * <a_sha> c6
       * <a_sha> c5 five - fifth commit
       *   <a_sha> *** let's do it
       |\
       | * 6fddd9c c4 not the third commit
       | * bab916a c3 the third commit
       | * 7355c79 c2 the second commit
       |/
       * 91182df c1
       """
