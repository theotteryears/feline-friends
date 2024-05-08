class SittersController < ApplicationController

  def index
    @sitters = User.where(role: 0)
    @sitters = policy_scope(User)
  end

end
