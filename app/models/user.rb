class User < ApplicationRecord
  has_secure_password validations: true
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true
  has_many :parent_categories
  has_many :notes

  has_many :tokens

  def generate_token!(ip)
    token = Token.create(
      value: SecureRandom.hex,
      user_id: id,
      expiry: DateTime.current + 7.days,
      ip: ip,
    )
  end
end
