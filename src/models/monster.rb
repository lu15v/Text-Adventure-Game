DB.create_table? :monsters do
  String :name, primary_key: true
  Integer :ferocity
end
class Monster < Sequel::Model
end
Monster.unrestrict_primary_key
