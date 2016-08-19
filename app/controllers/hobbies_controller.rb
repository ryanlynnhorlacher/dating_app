class HobbiesController < ApplicationController
  before_action :person, only: [:show, :edit, :update]
  before_action :hobby, only: [:show, :edit, :update, :destroy]

  def index
    @hobbies = @person.hobbies
  end

  def show

  end

  def new
    @hobby = Hobby.new
  end

  def create
    @hobby = @person.hobbies.new(hobby_params)
    if @person.save
      redirect_to person_hobbies_path(@person, @hobby)
    else
      render :new
    end
  end

  def edit

  end

  def update

    if @hobby.update(hobby_params)
      redirect_to person_hobby_path(@person, @hobby)
    else
      render :edit
    end
  end

  def destroy
    @hobby.destroy
    redirect_to person_hobby_path(@person, @hobby)
  end

  private
    def hobby_params
      params.require(:hobby).permit(:name, :description)
    end

    def person
      @person = Person.find(params[:id])
    end

    def hobby
      @hobby = @person.hobbies.find(params[:id])

    end
end
