require "gitloop/version"

module Gitloop

  class GitError < Exception; end

end

require File.dirname(__FILE__) + "/gitloop/looper"
