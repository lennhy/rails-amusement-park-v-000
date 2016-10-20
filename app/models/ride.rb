class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  # def start_ride
  #   remaining_tickets = self.user.tickets - self.attraction.tickets
  #   self.user.update(:tickets=> remaining_tickets)
  # end
  #
  # def take_ride
  #   user_tickets = self.user.tickets.to_i
  #   attraction_tickets = self.attraction.tickets.to_i
  #   if user_tickets < attraction_tickets
  #     "Sorry. You do not have enough tickets the #{self.attraction.name}."
  #   elsif self.user.height < self.attraction.min_height
  #      "You are not tall enough to ride the #{attraction.name}."
  #   end
  # end
  #
  def take_ride
     enough_tickets, tall_enough = meet_requirements
     if enough_tickets && tall_enough
       start_ride
     elsif tall_enough && !enough_tickets
       "Sorry. " + ticket_issue
     elsif enough_tickets && !tall_enough
       "Sorry. " + height_issue
     else
       "Sorry. " + ticket_issue + " " + height_issue
     end
   end

   def meet_requirements
     enough_tickets, tall_enough = false
     if self.user.tickets >= self.attraction.tickets
       enough_tickets = true
     end
     if self.user.height >= self.attraction.min_height
       tall_enough = true
     end
     return [enough_tickets, tall_enough]
   end

   def start_ride
     new_happiness = self.user.happiness + self.attraction.happiness_rating
     new_nausea = self.user.nausea + self.attraction.nausea_rating
     new_tickets =  self.user.tickets - self.attraction.tickets
     self.user.update(
       :happiness => new_happiness,
       :nausea => new_nausea,
       :tickets => new_tickets
     )
     "Thanks for riding the #{self.attraction.name}!"
   end

   def ticket_issue
     "You do not have enough tickets the #{self.attraction.name}."
   end

   def height_issue
     "You are not tall enough to ride the #{self.attraction.name}."
   end

end
