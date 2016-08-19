class AddressesController < ApplicationController
  before_action :person
  before_action :address, only: [:show, :edit, :update, :destroy]

  def index
    @addresses = @person.addresses
  end

  def show

  end

  def new
    @address = Address.new
  end

  def create
    @address = @person.addresses.new(address_params)
    if @person.save
      redirect_to person_addresses_path(@person, @address)
    else
      render :new
    end
  end

  def edit

  end

  def update

    if @address.update
      redirect_to person_address_path(@person, @address)
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to person_address_path(@person, @address)
  end

  private
    def address_params
      params.require(:address).permit(:street_address, :city, :state, :zip)
    end

    def person
      @person = Person.find(params[:id])
    end

    def address
      @address = @person.addresses.find(params[:id])

    end
end
