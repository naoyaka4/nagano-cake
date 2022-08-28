class Product < ApplicationRecord

  has_one_attached :image
  belongs_to :genre
  has_many :cart_products, dependent: :destroy
  has_many :order_details, dependent: :destroy

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [200, 200]).processed
  end

   # 税込価格
  def  add_tax_non_taced_price
  (self.non_taced_price * 1.10).round
  end



  # #カリキュラムの記述
  # def with_tax_price
  #   (price * 1.1).floor
  # end
  # enum is_active: { true: 0, false: 1 }
end
