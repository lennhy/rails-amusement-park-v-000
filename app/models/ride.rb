class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user
  require "pry"

  def take_ride
    ticket_cost = 5
    if  user.self < ticket_cost
      "Sorry. You do not have enough tickets the #{self.attraction.name}."
    end
  end

end
