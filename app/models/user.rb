class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]
  has_many :lists

  def self.from_omniauth(auth)
    if user = User.find_by_email(auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      user
    else
      u = User.new(
        :provider => auth.provider,
        :uid => auth.uid,
        :username => auth.info.name,
        :email => auth.info.email,
        :password => Devise.friendly_token.first(8))
      if u.save
        flash[:notice] = "Yay, usuario creado"
      else
        flash[:notice] = "Algo horrendo sucedio"
      end
      u
    end
  end
end
