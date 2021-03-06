class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :middle_name, :password, :password_confirmation, :remember_me, :email, :company_id

  def full_name
    [first_name, middle_name, last_name].compact.join(' ')
  end

  def middle_name_blank
    "#{middle_name}" unless middle_name.blank? 
  end

  has_many :worksites
  belongs_to :company
end
