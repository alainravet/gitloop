Feature: playing in the sanbox
  As a          developer
  In order to   test `gitloop` thoroughly
  I want to     Install in tmp/sandbox different prepared git repositories
                that cover all the possible combinations of staged/unstanged
                files


  Background:
        * I cleared the sandbox directory
        * a directory named "sandbox" should not exist


#############################
# Test the git status output :
#############################

  Scenario: checking the clean sandbox

     Given I unzip the clean git repo in the sandbox
         * I cd to "sandbox"
      Then the git status is empty


  Scenario: checking the sandbox with some unstaged changes

     Given I unzip the git repo with unstaged changes in the sandbox
         * I cd to "sandbox"
      Then the git status is:
         """
          M f1
         ?? unstaged-new-file
         """

  Scenario: checking the sandbox with some staged changes

     Given I unzip the git repo with staged changes in the sandbox
         * I cd to "sandbox"
      Then the git status is:
         """
         M  f1
         A  unstaged-new-file
         """



#############################
# Test the git log graph output :
#############################

  Scenario Outline: the sandbox is initialized by unzipping a model git repository

     Given I unzip the <repository> in the sandbox
         * I cd to "sandbox"

    Then the repo is in its original state
    Then HEAD starts with edadbb7
       * the current branch is "master"
       * there are <outcome>

    Examples:
      | repository                      | outcome                        |
      | clean git repo                  | no unstaged nor staged changes |



  Scenario Outline: the sandbox is initialized by unzipping a model git repository

     Given I unzip the <repository> in the sandbox
         * I cd to "sandbox"

    Then the git log graph is:
       """
       * a059392 c6
       * e917b56 c5
       * 933c4d1 c4
       * 4d72f8a c3
       * 8aab2de c2
       * 91182df c1
       """
    Then the git log graph matches:
       """
       * a059392 c6
       * <a_sha> c5
       * 933c4d1 c4
       * <a_sha> c3
       * 8aab2de c2
       * <a_sha> c1
       """
    Then HEAD starts with a059392
       * the current branch is "master"
       * there are <outcome>

    Examples:
      | repository                      | outcome                        |
      | git repo with unstaged changes  | untracked or uncommited changes|
      | git repo with staged changes    | untracked or uncommited changes|

