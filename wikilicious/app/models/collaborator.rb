class Collaborator < ActiveRecord::Base
  belongs_to :user
  belongs_to :wiki


  # def wikis
  # 	Wiki.where(collaborator_id: id)
  # end

  # def users
  # 	User.where(id: wikis.pluck(:user_id))
  # end

end
