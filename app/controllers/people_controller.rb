class PeopleController < ApplicationController
  before_action :person, only: [:show, :edit, :update, :destroy]

  def home
    @people = Person.all
    @user = Person.user
  end

  def switch
    @user = Person.reset_user
    redirect_to root_path
  end

  def set_user
    @user = Person.set_user(params[:id])
    redirect_to root_path
  end

  def index
    @people = Person.all
  end

  def show

  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      Person.set_user(@person)
      redirect_to person_path(@person)
    else
      render :new
    end
  end

  def edit

  end

  def update

    if @person.update(person_params)
      redirect_to person_path(@person)
    else
      render :edit
    end
  end

  def destroy
    @person.destroy
    redirect_to people_path
  end

  def search
    @people = Person.all
    @search = Person.search(params[:name], params[:age], params[:gender], params[:eye_color], params[:hair_color], params[:weight], params[:height])
  end

  private
    def person_params
      params.require(:person).permit(:name, :gender, :hair_color, :eye_color, :age, :weight, :height)
    end

    def person
      @person = Person.find(params[:id])
    end

end
