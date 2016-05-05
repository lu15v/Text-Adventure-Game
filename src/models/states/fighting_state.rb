class FightingState
  def initialize(game)
    @game = game
  end


  def handle
    return unless @game.current_room_model.monster
    #get the input for the user
    puts "Press any key to fight"
    key = gets.chomp
    player = @game.player
    items = @game.player.items
    weapons = items[:weapons]
    #omitted double ask for key line 740
    if key != nil #the user has to put any key
      new_ferocity = @game.current_room_model.monster.ferocity

      if items.has_key? :suit
        puts "your armor increases your chance of success"
        new_ferocity = 3 * (@game.current_room_model.monster.ferocity / 4).to_i
      end
      has_sword = weapons.include? :sword
      has_axe = weapons.include? :axe

      has_two_weapons = has_axe && has_sword
      if not has_two_weapons
        puts "You must fight with bare hands"
        new_ferocity = (new_ferocity + new_ferocity / 5).to_i
      end

      has_just_axe = has_axe && !has_sword
      if has_just_axe
        puts "You has only an axe to fight"
        new_ferocity = 4 * (new_ferocity / 5).to_i
      end

      has_just_sword = has_sword && !has_axe

      if has_just_sword
        puts "You must fight with your sword"
        new_ferocity = 3 * (new_ferocity / 4).to_i
      end

      #change to face 2
      #store first axe before sword
      loop do
        choice_weapon = gets.chomp.to_i
        weapons.each_with_index do |weapon, i|
            puts "#{i + 1} #{weapon}"
        end
        if choice_weapon == 1
          new_ferocity =  4 * (new_ferocity / 5).to_i
        elsif choice_weapon == 2
          new_ferocity =  3 * (new_ferocity / 4).to_i
        end
        break if choice_weapon >= 1 && choice_weapon <= weapons.length
      end

      #change to face 3 THE BATTLE
      # TODO loop do line 940
      if rand() > 0.5
        puts "Attacks"
      else
        puts "You attack"
      end

      if rand() > 0.5 && player.has_torch?
        puts "Your Torch was knocked from your hand"
        items.delete :torch
      end

      if rand() > 0.5 && items.has_key?(:axe)
        puts "You drop your ace in the heat of battle"
        items.delete :axe
        new_ferocity = 5 * (new_ferocity / 4).to_i
      end

      if rand() > 0.5 && items.has_key?(:sword)
        puts "Your Sword is knocked from your hand!!!"
        items.delete :sword
        new_ferocity = 4 * (new_ferocity / 3).to_i
      end

      if rand() > 0.5
        puts "You manage to wound it"
        new_ferocity = (5 * new_ferocity / 6).to_i
      end

      if rand() >  0.95
        puts "Aaaaargh!!"
        puts "Rip! Tear! Rip!"
      end

      if rand() > 0.9
        puts "You Want to run but you stand your ground..."
      end

      if rand() > 0.9
        puts '*&%%$#$% $%# !! @ #$$# #$@! #$ $#$'
      end

      if rand() > 0.7
        puts "Will this be a battle to the death?"
      end

      if rand() > 0.7
        puts "His eyes flash fearfully"
      end

      if rand() > 0.7
        puts "Blood drips from his claws"
      end

      if rand() > 0.7
        puts "You smell the sulphur on his breath"
      end

      if rand() > 0.7
        puts "He strikes wildly, madly......"
      end

      if rand() > 0.7
        puts "You have never fought and opponent like this!!"
      end

      if rand() > 0.5
        puts "The monster wounds you!!!"
        player.strength -= 5
      end

      #if the condition of the loop do is false
      if rand() * 16 > new_ferocity
        # TODO implement the to_s from monster
        puts "And you managed to kill the #{@game.current_room_model.monster}"
        player.monsters_killed += 1
        # TODO update game room status
      else
        puts "The #{@game.current_room_model.monster} defeated you"
        player.strength /= 2
      end

    end
  end
end

#game.current_room = room.name
