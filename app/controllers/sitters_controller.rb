class SittersController < ApplicationController

  def index
    @sitters = policy_scope(User)
    @sitters = User.where(role: "cat_sitter")
    @cat = Cat.new
  end

end
