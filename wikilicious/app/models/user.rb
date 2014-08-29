class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis
  has_many :collaborators

  def collaborated_wikis
    collaborators.collect(&:wiki)
  end

  def can_collaborate_on?(wiki)
    wikis.include?(wiki) || collaborated_wikis.include?(wiki)
  end

  def showing_collaborator
    wiki = Wiki.friendly.find(params[:id])
    @wiki = wiki if current_user.can_collaborate_on?(wiki)
    @wiki
  end
end
