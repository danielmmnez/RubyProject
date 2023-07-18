class PhonesController < ApplicationController
  def index
    @phones = Phone.all
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
    params.require(:phone).permit(:name, :ram, :brand, :price, :storage)
  end
end
