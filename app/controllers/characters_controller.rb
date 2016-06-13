class CharactersController < ApplicationController

  def index
    @user = User.find_by_name(params[:user_id])
    @characters = @user.characters.paginate(page: params[:page], per_page: 10)
  end

  def show
    @character = Character.find_by_id(params[:id])
  end

  def new
    @character = current_user.characters.build
  end

  def create
    @character = current_user.characters.build(character_params)
    if @character.save
      redirect_to [current_user, @character]
    else
      flash[:danger] = "Error creating character"
      redirect_to :back
    end
  end

  def edit
    @character = Character.find_by_id(params[:id])
  end

  def update
    @character = Character.find_by_id(params[:id])
    if @character.update_attributes(character_params)
      flash[:success] = "Character Updated"
      redirect_to [@character.user, @character]
    else
      render 'edit'
    end
  end

  private

    def character_params
      params.require(:character).permit(:name, :avatar)
    end
end
