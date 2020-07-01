class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, :last_name, :password_confirmation, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, length: { minimum: 8 }


  before_save :downcase_email

  def downcase_email
    self.email.downcase!
  end

  def self.authenticate_with_credentials(email, password)
    User.find_by(email: "#{email}").try(:authenticate, "#{password}")
  end

end
