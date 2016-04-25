class Graph
  def initialize
    @list = []
    @depth = 0
  end

  def << value
    case value
    when '\\'
      @depth -= 1
    when '/'
      @depth += 1
    when '_'
      ;
    else raise '変な値が入れられた' + value
    end
    @list << Point.new(value, @depth)
  end

  def calc_pools
    @list.each {|item|
      
    }
  end

  class Point
    def initialize value, depth
      @depth = depth
      @value = value
    end
  end
end

def main commands

end


inputs = STDIN.read.split(/\n/)
inputs.shift

main(inputs)
