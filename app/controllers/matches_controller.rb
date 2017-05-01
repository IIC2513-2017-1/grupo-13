class MatchesController < ApplicationController
  def index
    @matches = Matches.all
  end

  def new
    @matches = Matches.new
  end

  def create
    @matches = Matches.new(matches_params)
  end

  def destroy
  end

end
