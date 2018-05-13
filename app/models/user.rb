class User < ApplicationRecord
  has_secure_password validations: true
  # gem bcryptでpasswordを暗号化。
  # passwordが必須入力で、confirmationと内容が合致すること。

  # メールはnullを許容せず一意である
  validates :mail, presence: true, uniqueness: true

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA256.hexdigest(token.to_s)
  end
end
