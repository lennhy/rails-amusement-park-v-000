class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  attr_accessor :to_num

  def to_num
    self.tickets.to_i
  end

  def mood
    if self.nausea > self.happiness
      "sad"
    else
      "happy"
    end
  end


end
