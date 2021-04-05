class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password, length: {minimum: 3}
  validates :password_confirmation, presence: true
  validates_uniqueness_of :email, :case_sensitive => false
  before_save { self.email.downcase!}


  def self.authenticate_with_credentials(email, password)
    new_email = email.downcase.strip
    user = User.find_by_email(new_email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
