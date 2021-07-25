class PuppiesController < ApplicationController
  def index
    puppies = Puppy.all
    render json: puppies.as_json
  end

  def create
    puppy = Puppy.new(
      name: params[:name],
      breed: params[:breed],
      months: params[:months],
    )
    puppy.save
    render json: puppy.as_json
  end

  def show
    puppy = Puppy.find_by(id: params[:id])
    render json: puppy.as_json
  end

  def update
    puppy = Puppy.find_by(id: params[:id])
    puppy.name = params[:name] || puppy.name
    puppy.breed = params[:breed] || puppy.breed
    puppy.months = params[:months] || puppy.months
    puppy.save
    render json: puppy.as_json
  end
end
