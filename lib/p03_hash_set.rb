require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if @count == num_buckets
      resize!
    end
    self[key.hash] << key unless include?(key)
    @count += 1
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    self[key.hash].delete(key) if include?(key)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(2 * num_buckets){[]}
    @store.each do |bucket|
      bucket.each do |element|
        new_store[element.hash % (2 * num_buckets)] << element
      end
    end
    @store = new_store
  end
end
