class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owner=Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
     @pet= Pet.create(params[:pet])
     if params[:pet][:owner_id]
       @pet.owner = Owner.find_by_id(params[:pet][:owner_id])
     end
     @pet.save
     if params[:owner][:name] != ""
       @pet.owner = Owner.create(name: params["owner"]["name"])
       @pet.save
     end
     redirect to "pets/#{@pet.id}"
   end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do

    redirect to "pets/#{@pet.id}"
  end
end
