DB.create_table? :monsters do
  String :name, primary_key: true
  Integer :ferocity
end
class Monster < Sequel::Model
  one_to_many :rooms
end
Monster.unrestrict_primary_key
