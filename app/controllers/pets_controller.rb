class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @pets = Pet.all
  end

  def new
  end

  def create
  end
end
