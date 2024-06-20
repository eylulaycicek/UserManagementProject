class User < ApplicationRecord
  belongs_to :address
  belongs_to :company
  has_many :albums, dependent: :destroy

  def photo_url
    "https://picsum.photos/id/#{id}/200/200" 
  end
end
