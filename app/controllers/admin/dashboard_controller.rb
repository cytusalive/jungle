class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["USERNAME"].to_s, password: ENV["PASSWORD"].to_s
  
  def show
    @num_products = Product.count
    @num_categories = Category.count
  end
end
