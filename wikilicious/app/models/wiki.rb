class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :description, use: :slugged

  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  def collaborator_for(user)
  	collaborators.where(user_id: user.id).first
  end
end
