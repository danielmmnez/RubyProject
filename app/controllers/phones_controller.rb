class PhonesController < ApplicationController
  def index
    pp params[:category_id]
    @categories = Category.order(name: :asc).load_async
    @phones = Phone.order(created_at: :desc).load_async
    if params[:category_id]
      @phones = @phones.where(category_id: params[:category_id])
    end
  end

  def show
    @phone = Phone.find(params[:id])
  end

  def new
    @phone = Phone.new
  end

  def create
    @phone = Phone.new(phone_params)
    if @phone.save
      redirect_to @phone
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @phone = Phone.find(params[:id])
  end

  def update
    @phone = Phone.find(params[:id])
    if @phone.update(phone_params)
      redirect_to @phone
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @phone = Phone.find(params[:id])
    @phone.destroy
    redirect_to root_path, status:
    :see_other
  end

  private
  def phone_params
    params.require(:phone).permit(:name, :ram, :brand, :price, :storage, :category_id)
  end
end
