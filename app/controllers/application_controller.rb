class ApplicationController < ActionController::Base
  before_action -> { sleep 2 }
end
