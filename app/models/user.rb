class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password



  # def self
  #   self.tickets.to_i
  # end
  #
  # def mood
  #   if self.nausea.to_i > self.happiness.to_i
  #     "sad"
  #   else
  #     "happy"
  #   end
  # end

    def mood
      if self.happiness && self.nausea
        mood = self.happiness - self.nausea
        mood > 0 ? "happy" : "sad"
      end
    end

    def num_of_rides
      self.attractions.count
    end


end
