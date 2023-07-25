class CartController < ApplicationController
  def show
    @render_cart = false
  end


  def add
    @phone = Phone.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(phone_id: @phone.id)
    if current_orderable && quantity > 0
      current_orderable.update(quantity:)
    elsif quantity <= 0
      current_orderable.destroy
    else
      @cart.orderables.create(phone: @phone, quantity:)
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.replace('cart',
                                                    partial: 'cart/cart',
                                                    locals: {cart: @cart}),
                              turbo_stream.replace(@phone)]
      end
    end
  end

  def remove
    Orderable.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.replace('cart',
          partial: 'cart/cart',
          locals: {cart: @cart})]
      end
    end
  end

  def payout
    @cart = Cart.create
    session[:cart_id] = @cart.id
    session[:message] = 'Tanks for shopping with us, we hope you enjoy it!'
    redirect_to root_path
  end

  def clear
    @cart.orderables.each do |orderable|
      Orderable.find_by(cart_id: params[:cart_id]).destroy
    end
    redirect_to cart_path
  end
end
