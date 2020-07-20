class ApplicationController < ActionController::Base
  before_action -> { sleep 0 }
end
