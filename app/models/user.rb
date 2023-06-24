class User < ApplicationRecord
  has_secure_password validations: true
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true
  has_many :tokens

  has_many :notes, dependent: :destroy
  has_many :parent_categories, dependent: :destroy

  def generate_token!(ip)
    token = Token.create(
      value: SecureRandom.hex,
      user_id: id,
      expiry: DateTime.current + 7.days,
      ip: ip,
    )
  end
end
