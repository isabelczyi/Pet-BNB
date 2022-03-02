class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :dog, :cat, :fish, :reptile, :others]

  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
    authorize @pet
  end

  def dog
    @pets = Pet.where("category = 'Dogs'")
  end

  def cat
    @pets = Pet.where("category = 'Cats'")
  end

  def fish
    @pets = Pet.where("category = 'Fish'")
  end

  def reptile
    @pets = Pet.where("category = 'Reptiles'")
  end

  def others
    @pets = Pet.where("category = 'Others'")
  end

  def create
    @pet = Pet.new(pet_params)
    authorize @pet
    @pet.user = current_user
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def show
    @pet = Pet.find(params[:id])
    authorize @pet
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :category, :location, :price, :description)
  end
end
