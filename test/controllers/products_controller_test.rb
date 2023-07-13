require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest

  test 'render a list of products' do

    get products_path

    assert_response :success

    assert_select '.product', 2

  end

  test 'render a detailed product page' do

    get product_path(products(:Iphone14))

    assert_response :success

    assert_select '.title', 'Iphone14'

    assert_select '.description', '256GB 6GB RAM'

    assert_select '.price', '3600000$'

  end

  test 'render a new product form' do

    get new_product_path

    assert_response :success

    assert_select 'form'

  end

end
