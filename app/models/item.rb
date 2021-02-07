class Item < ApplicationRecord
  belongs_to :list, dependent: :destroy 
end
