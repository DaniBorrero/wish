class List < ApplicationRecord
  belongs_to :event
  has_many :items, dependent: :destroy 
end
