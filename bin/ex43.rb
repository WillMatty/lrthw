class Game

  def initialize(start)
    @quips = [
      "You died. You kind of suck at this.",
      "Nice job, you died ... twit.",
      "Such a loser..",
      "I have a small puppy that's better at this.",
    ]
    @start = start
  end

  def prompt()
    print "> "
  end

  def play()
    next_room = @start

    while true
      puts "\n--------"
      room = method(next_room)
      next_room = room.call()
    end
  end

  def death()
    puts @quips[rand(@quips.length())]
    Process.exit(1)
  end

  def central_corridor()
    c_c1 = <<-Str
The Gothons of Planet Percal #25 have invaded your ship and destroyed
your entire crew. You are the last surviving member and your last
mission is to get the neutron destruct bomb from the Weapons Armoury,
put it in the bridge, and blow your ship up after getting into an
escape pod.
    
You're running down the central corridor to the Weapons Armoury when
a Gothon jumps out, red scaly skin, dark grimy teeth, and an evil clown costume
flowing around his hate-filled body. He's blocking the door to the
Armoury and about to pull a weapon to blast you.
    Str

    puts c_c1

    prompt()
    action = gets.chomp()

    if action.include? "shoot"
      c_c2 = <<-Str
Quick on the draw you yank out your blaster and fire it at the Gothon.
His clown costume is flowing and moving around his body, which throws
off your aim. Your laser hits his costume but misses him entirely. This
completely ruins his brand new costume his mother bought him, which
makes him fly into an insane rage and blast you repeatedly in the face until
you are dead. Then he eats you.
      Str

      puts c_c2
      return :death

    elsif action.include? "dogde"
      c_c3 = <<-Str
Like a world class boxer, you dogde, weave, slip and slide right
as the Gothon's blaster cranks a laser past your head
In the middle of your artful dodge, your foot slips and you
bang your head on the metal wall and pass out
You wake up shortly after only to die as the Gothon stomps on
your head and eats you.
      Str

      puts c_c3
      return :death

    elsif action.include? "joke"
      c_c4 = <<-Str 
Lucky for you they make you learn Gothon insults in the academy.
You tell the one Gothon joke you know:
Lbhe zbgure vf fb sng, jura fur fvgf nebhaq gur ubhfr, fur fvgf nebhaq gur ubhfr.
The Gothon stops, tries not to laugh, then bursts out laughing and can't move.
While he's laughing you run up and shoot him square in the head
putting him down, then jump through the Weapon Armoury door.
      Str

      puts c_c4
      return :laser_weapon_armoury

    else
      puts "DOES NOT COMPUTE!"
      return :central_corridor
    end
  end

  def laser_weapon_armoury()
    lwp1 = <<-Str
You do a dive roll into the Weapon Armoury, crouch and scan the room
for more Gothons that might be hiding. It's dead quiet, too quiet.
You stand up and run to the far side of the room and find the
neutron bomb in its container. There's a keyboard lock on the box
and you need the code to get the bomb out. If you get the code
wrong 10 times then the lock closes forever and you can't
get the bomb. The code is 3 digits. Each digit only goes up to 5
however.
    Str

    puts lwp1
    code  = "%s%s%s" % [rand(5)+1, rand(5)+1, rand(5)+1]
    print "[keypad]> "
    guess = gets.chomp()
    guesses = 0


    while guess != code and guesses < 9
      puts "BZZZZZDDDD!"
      guesses += 1
      print "[keypad]> "
      guess = gets.chomp()
    end

    if guess == code
      lwp2 = <<-Str
The container clicks open and the seal breaks, letting gas out.
You grab the neutron bomb and run as fast as you can to the
bridge where you must place it in the right spot.
      Str

      puts lwp2
      return :the_bridge
    else
      lwp3 = <<-Str
The lock buzzes one last time and then you hear a sickening
melting sound as the mechanism is fused together.
You decide to sit there, and finally the Gothons blow up the
ship from their ship and you die.
      Str

      puts lwp3
      return :death
    end
  end

  def the_bridge()
    b1 = <<-Str
You burst onto the Bridge with the neutron destruct bomb
under your arm and surprise 5 Gothons who are trying to
take control of the ship. Each of them has an even uglier
clown costume than the last. They haven't pulled their
weapons out yet, as they see the active bomb under your
arm and don't want to set it off.
    Str

    puts b1
    prompt()
    action = gets.chomp()

    if action.include? "throw"
      b2 = <<-Str
In a panic you throw the bomb at the group of Gothons
and make a leap for the door. Right as you drop it a
Gothon shoots you right in the back killing you.
As you die, you see another Gothon frantically try to disarm
the bomb. You die knowing they will probably blow up when
it goes off.
      Str

      puts b2
      return :death

    elsif action.include? "place"
      b3 = <<-Str
You point your blaster at the bomb under your arm
and the Gothons put their hands up and start to sweat.
You inch backwards to the door, open it, and then carefully
place the bomb on the floor, pointing your blaster at it.
You then jump back through the door, punch the close button
and blast the lock so the Gothons can't get out.
Now that the bomb is placed, you run to the escape pod to
get off this tin can.
      Str

      puts b3
      return :escape_pod
    else
      puts "DOES NOT COMPUTE!"
      return :the_bridge
    end
  end

  def escape_pod()
    e1 = <<-Str
You rush through the ship desperately trying to make it to
the escape pod before the whole ship explodes. It seems like
hardly any Gothons are on the ship, so your run is clear of
interference. You get to the chamber with the escape pods, and
now need to pick one to take. Some of them could be damaged
but you don't have time to look. There are 5 pods, which one
do you take?
    Str

    puts e1
    good_pod = rand(5)+1
    print "[pod #]> "
    guess = gets.chomp()

    if guess.to_i != good_pod
      e2 = <<-Str
You jump into pod %s and hit the eject button.
The pod escapes out into the void of space, then
implodes as the hull ruptures, crushing your body
into humanberry jam.
      Str

      puts e2 % guess
      return :death
    else
      e3 = <<-Str
You jump into pod %s and hit the eject button.
The pod easily slides out into space heading to
the planet below. As it flies to the planet, you look
back and see your ship implode then explode like a
bright star, taking out the Gothon ship at the same
time. You won!
      Str

      puts e3 % guess
      Process.exit(0)
    end
  end
end

a_game = Game.new(:central_corridor)
a_game.play()
