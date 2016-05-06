# Final Project: A Text Adventure Game
# Date: 05-May-2016
# Authors: A01020319 Fernando Gomez Herrera
#          A01371743 Luis Eduardo Ballinas Aguilar

DB.create_table? :monsters do
  String :name, primary_key: true
  Integer :ferocity
end

#The Monster class, provide a monster in a specific room
class Monster < Sequel::Model
  one_to_many :rooms

  # String representation of a monster in the format:
  #   #{@name} | FF: #{@ferocity}
  def to_s
    "#{self.name} | Ferocity: #{self.ferocity}"
  end
end
Monster.unrestrict_primary_key
