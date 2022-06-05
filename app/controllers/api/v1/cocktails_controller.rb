class Api::V1::CocktailsController < Api::V1::BaseController

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def search
    @cocktails = Cocktail.search_by_name(params[:name])
  end

  def create
    params = cocktail_params
    params[:name] = params[:name].downcase.capitalize
    @cocktail = Cocktail.new(params)
    if @cocktail.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :ingredients, :preparation, :image)
  end

  def render_error
    render json: { errors: @cocktail.errors.full_messages },
      status: :unprocessable_entity
  end

end
