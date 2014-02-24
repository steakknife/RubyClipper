class User < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :email

  has_many :authorizations

  def self.create_with_omniauth(auth_hash)
    # todo: dont create if the email already exists
    options = {}
    if auth_hash['info']
      name = auth_hash['info']['name'] || ''
      options[:email] = auth_hash['info']['email'] || ''
    end
    # Check if the user already exists, so we don't create two
    user = find_or_create_by!(options) do |user|
      user.name = name unless name.blank?
    end
    # Check if the provider already exists, so we don't add it twice
    Authorization.find_or_create_by! user: user, provider: auth_hash['provider'], uid: auth_hash['uid'] 
    user
  end
end

