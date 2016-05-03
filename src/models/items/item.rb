class Item
  def self.name
    self::NAME
  end
  def self.cost
    self::COST
  end

  def to_s
    "#{NAME} ($#{COST})"
  end
end
