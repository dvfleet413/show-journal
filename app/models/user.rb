class User < ApplicationRecord
    has_secure_password
    validates_presence_of :username, :email
    validates_uniqueness_of :username
    has_many :viewings 
    has_many :shows, through: :viewings
    has_many :reviews, through: :viewings


    def composers 
        shows.map {|show| show.composer }
    end
end
