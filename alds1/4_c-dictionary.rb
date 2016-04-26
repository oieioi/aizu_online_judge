class Dictionary
  DNA = %w(A C G T)

  def initialize
    @container = Array.new(64)
  end

  def exec command, str
   case command
   when 'insert' then insert str
   when 'find'   then puts(find?(str) ? 'yes' : 'no')
   else raise 'へん'
   end
  end

  private

  def insert str
    @container[hash(str)] = true
  end

  def find? str
    not find(str).nil?
  end

  def find str
    @container[hash(str)] 
  end

  def hash str
    base = 4
    # AAA 〜 TTT までの数字を4進数 -> 10進数に変換する
    str.chars.map {|c|
      case c
      when DNA[0] then '0'
      when DNA[1] then '1'
      when DNA[2] then '2'
      when DNA[3] then '3'
      else raise 'へん'
      end
    }
      .reverse.map.with_index { |n, index| (base * index) * n.to_i }
      .reduce {|memo, item| memo + item}
  end
end

def main size, commands
  dic = Dictionary.new
  commands.each{|raw_command|
    command, str = raw_command.split ' '
    dic.exec(command, str)
  }
end

array = STDIN.read.split(/\n/)
size = array.shift

main(size, array)
