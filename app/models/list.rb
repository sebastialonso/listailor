class List < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :users
  has_and_belongs_to_many :videos
  has_and_belongs_to_many :tags
end
