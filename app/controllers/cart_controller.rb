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
    clear
    root_path
  end

  def clear
    @cart ||= Cart.find_by(id: session[:cart_id])
    root_path
  end

end
