class ApplicationController < ActionController::Base
  def self.current_user
    user = User.first
    puts user.name
    user
  end
end
