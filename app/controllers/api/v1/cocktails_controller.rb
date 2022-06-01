class Api::V1::CocktailsController < Api::V1::BaseController

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def search
    @cocktails = Cocktail.search_by_name(params[:name])
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if unique_cocktail
      if @cocktail.save
        render :show, status: :created
      else
        render_error
      end
    else
      render_not_unique
    end
  end

  def unique_cocktail
    Cocktail.find_by(name: cocktail_params[:name]) == nil
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :ingredients, :preparation, :image)
  end

  def render_error
    render json: { errors: @cocktail.errors.full_messages },
      status: :unprocessable_entity
  end

  def render_not_unique
    render json: { errors: "cocktail is not unique" },
      status: :unprocessable_entity
  end

end
