class InfiniteSet

  private
    def self.create(&block)
      set = self.new
      set.block = block
      return set
    end

  public
    attr_accessor :block

    POSITIVES = InfiniteSet.create { |x| x > 0 }
    NEGATIVES = InfiniteSet.create { |x| x < 0 }

    def include?(x)
      self.block.call(x)
    end

end
