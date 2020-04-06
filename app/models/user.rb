class User < ApplicationRecord
    has_secure_password
    validates_presence_of :username, :email
    validates_uniqueness_of :username, :email





#  Idea for simple model instance method to list all composers that user has seen
#    def composers
#      shows.map {|show| show.composer }
#    end
#  since user has_many shows through viewings, and each show belongs_to a composer, this should return 
#  an array of the composers the user has seen
end
