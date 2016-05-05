DB.create_table? :monsters do
  String :name, primary_key: true
  Integer :ferocity
end
class Monster < Sequel::Model
  #def self.ferocity_factor
    #self::FEROCITY_FACTOR
  #end
end
Monster.unrestrict_primary_key
