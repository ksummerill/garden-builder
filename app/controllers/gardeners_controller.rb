class GardenersController < ApplicationController

  def new
    @gardener = Gardener.new
  end
end
