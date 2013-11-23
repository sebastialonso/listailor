class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]
  has_and_belongs_to_many :lists

  def self.find_for_google_oauth2(access_token, signed_in_resoruce=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid).first
    if user
      user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        registered_user
      else
        user = User.new(username: data["name"],
          provider: access_token.provider,
          email: data["email"],
          uid: access_token.uid,
          password: Devise.friendly_token[0,20])
        if data["image"] == nil
          user.avatar = ""
        else
          user.avatar = data["image"]
        end 
        user.save
        user
      end
    end
  end
end
