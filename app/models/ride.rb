class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user
  require "pry"

  def take_ride
    ticket_cost = 5
    if  self.user.to_num < ticket_cost
      "Sorry. You do not have enough tickets the #{self.attraction.name}."
    end
  end

end
