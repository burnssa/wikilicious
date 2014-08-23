class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis
  has_many :collaborators, through: :wikis


  def wikis
  	Wiki.where(user_id: id)
  end

  def collaborators
  	Collaborator.where(id: wikis.pluck(:collaborator_id))
  end

end
