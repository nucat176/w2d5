class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max + 1){false}
  end

  def insert(num)
    if is_valid?(num)
      @store[num] = true
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
    if is_valid?(num)
      @store[num] = false
    else
      raise "Out of bounds"
    end
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num >= 0 && num <= @max
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % 20] << num unless include?(num)
  end

  def remove(num)
    @store[num % 20].delete(num) if include?(num)
  end

  def include?(num)
    @store[num % 20].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if @count == num_buckets
      resize!
    end
    @store[num % num_buckets] << num unless include?(num)
    @count += 1
  end

  def remove(num)
    @store[num % num_buckets].delete(num) if include?(num)
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(2 * num_buckets){[]}
    @store.each do |bucket|
      bucket.each do |element|
        new_store[element % (2 * num_buckets)] << element
      end
    end
    @store = new_store
  end
end
