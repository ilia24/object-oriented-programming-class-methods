class Zombie
  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed= 1
  @@default_strength = 3

#CLASS METHODS
#This method returns the horde value
  def self.all
    @@plague_level
  end

#increases plague by a randum num between 0-2
  def self.increase_plague_level
    @@plague_level += rand(3)
  end



#INSTANCE METHODS

end
