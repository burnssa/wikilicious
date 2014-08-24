class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :description, use: :slugged

  belongs_to :user
end
