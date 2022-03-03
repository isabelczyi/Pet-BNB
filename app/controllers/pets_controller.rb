class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :dog, :cat, :fish, :reptile, :bird, :all, :show]

  def index
    @pets = policy_scope(Pet).order(created_at: :desc)
  end

  def all
    @pets = policy_scope(Pet).order(created_at: :desc)
  end

  def new
    @pet = Pet.new
    authorize @pet
  end

  def dog
    @pets = Pet.where("category = 'Dogs'")
    authorize @pets
  end

  def cat
    @pets = Pet.where("category = 'Cats'")
    authorize @pets
  end

  def fish
    @pets = Pet.where("category = 'Fish'")
    authorize @pets
  end

  def reptile
    @pets = Pet.where("category = 'Reptiles'")
    authorize @pets
  end

  def bird
    @pets = Pet.where("category = 'Birds'")
    authorize @pets
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
    @markers =[
      {
        lat: @pet.latitude,
        lng: @pet.longitude,
        info_window: render_to_string(partial: "info_window", locals: { pet: @pet }),
        image_url: "http://res.cloudinary.com/dyr0u2nqe/image/upload/v1646310640/x9uhrgqmvof9apbjyrrg.png"
      }]
  end

  def edit
    @pet = Pet.find(params[:id])
    authorize @pet
  end

  def update
    @pet = Pet.find(params[:id])
    authorize @pet
    @pet.user = current_user
    if @pet.update(pet_params)
      redirect_to pet_path(@pet)
    else
      render :edit
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    authorize @pet
    @pet.destroy

    redirect_to root_path
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :category, :location, :price, :description, photos: [])
  end
end
