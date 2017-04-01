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

#uses @plague_level to gen a random numb and create that many zombies, each zombie is created using the intialize method, with random numbers generated to feed into the init method
  def self.create
    zombies = rand(@@plague_level)
    zombies.times do
      rspeed = rand(@@max_speed)
      rstrength = rand(@@max_strength)
      zombie = new(rspeed, rstrength)
      @@horde << zombie
    end
  end

#generates a random number between 1-10 and kills that many zombies

def self.some_die_off
  ztokill = rand(11)
  ztokill.times {@@horde.delete(@@horde.sample)}
end

#INSTANCE METHODS

#this method will initialize a zombie, checking to make sure both var's are within max range (otherwise sets to default)
  def initialize(zspeed, zstrength)
    if zspeed <= @@max_speed
      @zspeed = zspeed
    else
      @zspeed = @@default_speed
    end

    if zstrength <= @@max_strength
      @zstrength = zstrength
    else
      @zstrength = @@default_strength
    end
  end

#DEBUG CODE

  def self.print
    @@horde
  end

  def self.test
    @@horde.delete(@@horde.sample)
  end
end
