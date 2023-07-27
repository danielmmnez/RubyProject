class CategoriesController < ApplicationController

  def index
    @categories = Category.all.order(name: :asc)

  end


  def new
    @category = Category.new
  end

  def edit
    category
  end


  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_url, notice: "Category was successfully created." }
      else
        render :new, status: :unprocessable_entity 
        
      end
    end
  end

  def update
    respond_to do |format|
      if category.update(category_params)
        format.html { redirect_to categories_url, notice: "Category was successfully updated." } 
      else
        render :edit, status: :unprocessable_entity
        
      end
    end
  end

  def destroy
    category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
      
    end
  end

  private
    
    def category
      @category = Category.find(params[:id])
    end

    
    def category_params
      params.require(:category).permit(:name)
    end
end
