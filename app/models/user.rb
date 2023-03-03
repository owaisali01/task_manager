class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :boards
  has_many :assigned_tasks
  has_many :tasks, through: :assigned_tasks
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

def authenticate(email, password)
  user = User.find_for_authentication(email: email)
  user.try(:valid_password?, password) ? user : nil
end

end