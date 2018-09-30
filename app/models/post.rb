class Post < ApplicationRecord
  belongs_to :user
  has_many :rates

  scope :top, -> (count) { order(average_rating: :desc).limit(count) }

  def update_rating
    transaction do
      update_attributes(average_rating: rates&.average(:value).to_f.round(2))
    end
  end
end
