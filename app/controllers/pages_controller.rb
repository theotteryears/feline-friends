class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # check if user is an owner or a sitter
    # redirect to the right page
    # raise
    if current_user&.cat_sitter?
      redirect_to cats_path
    elsif current_user&.cat_owner?
      redirect_to user_matches_path(current_user)
    end
  end

  def profile
    @matches = Match.all
    @past_matches = @matches.select { |match| match.status != "pending"}
  end
end
