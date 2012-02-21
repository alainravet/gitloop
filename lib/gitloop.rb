module Gitloop

  class GitError < Exception; end

end

require File.dirname(__FILE__) + "/gitloop/version"
require File.dirname(__FILE__) + "/gitloop/looper"
