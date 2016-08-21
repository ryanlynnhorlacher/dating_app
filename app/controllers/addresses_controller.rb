class AddressesController < ApplicationController
  before_action :person
  before_action :address, only: [:show, :edit, :update, :destroy]

  def index
    @address = @person.address
  end

  def show
  end

  def new
    @address = Address.new
  end

  def create
    @address = @person.address = Address.new(address_params)
    if @address.save
      redirect_to person_addresses_path(@person, @address)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to person_address_path(@person, @address)
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to person_addresses_path(@person)
  end

  private
    def address_params
      params.require(:address).permit(:street_address, :city, :state, :zip, :person_id)
    end

    def person
      @person = Person.find(params[:person_id])
    end

    def address
      @address = @person.address
    end
end
