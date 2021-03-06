class User < ActiveRecord::Base
  # note: id is uuid, so first and last wont work
  # scope :first, -> { order('created_at').first }
  # scope :last, -> { order('created_at DESC').first }
  
  # name: string
  validates :name, presence: true, length: { maximum: 145 }

  # email: string
  validates :email, presence: true, uniqueness: true, length: { maximum: 200 }, email: true

  has_many :authorizations, dependent: :destroy

  class AuthInfo
    attr_reader :auth_hash

    def initialize(auth_hash)
      @auth_hash = auth_hash
    end

    def info
      auth_hash && auth_hash['info'] || {}
    end

    def uid
      auth_hash && auth_hash['uid']
    end

    def provider
      auth_hash && auth_hash['provider']
    end

    def email
      if provider == 'twitter'
        "twitter#{uid}@domain.com" # temporary fake email
      else
        info && info['email'] || ''
      end
    end

    def name
      info && info['name'] || ''
    end
  end


  def self.create_with_omniauth(auth_hash)
    auth = AuthInfo.new(auth_hash)
    if previous_authorization = Authorization.where(provider: auth.provider, uid: auth.uid).first
      return previous_authorization.user
    end

    options = {}
    options[:email] = auth.email unless auth.email.blank?

    # Check if the user already exists, so we don't create two
    user = find_or_create_by!(options) do |user|
      # only set the name here on create so it doesnt overwrite what a user set
      user.name = auth.name unless auth.name.blank?
    end
    # Check if the provider already exists, so we don't add it twice
    Authorization.create! user: user, provider: auth.provider, uid: auth.uid 
    user
  end
end

