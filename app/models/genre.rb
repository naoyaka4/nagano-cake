class Genre < ApplicationRecord
  
  has_many :products, dependent: :des
  
end
