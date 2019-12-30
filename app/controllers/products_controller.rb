class ProductsController < InheritedResources::Base

  private

    def product_params
      params.require(:product).permit(:title, :image, :detail, :price, :currency)
    end

end
