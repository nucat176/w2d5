class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return 1890723089172093780912.hash + 1 if self.empty?
    hash = self[0].hash
    self[1..-1].each do |el|
      hash -= el.hash
    end
    hash
  end
end

class String
  def hash
    split_string = self.split("")
    ascii_array = split_string.map{|char| char.ord}
    ascii_array.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash = 0
    self.each do |key, value|
      hash += key.to_s.hash + value.hash
    end
    hash
  end
end
