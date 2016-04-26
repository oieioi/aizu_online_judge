class Dictionary
  DNA = [''] + %w(A C G T)

  def initialize n
    @size = 100000
    @container = Array.new(@size)
    @ret = []
  end
  attr_accessor :ret

  def exec command, str = ''
    case command
    when 'insert' then insert str
    when 'find'   then @ret << (find?(str) ? 'yes' : 'no')
    else raise 'へん'
    end
  end

  #private

  def insert str
    #puts "#{str} : #{hash(str)}"
    if @container[hash(str)].nil?
      @container[hash(str)] = LinkList.new str
    else
      group = @container[hash(str)]
      found = group.has? str
      group.insert(str) unless found
    end
  end

  def find? str
    linked_list = @container[hash(str)]
    return false if linked_list.nil?

    linked_list.has?(str)
  end

  def hash str
    # 超素朴な実装
    # AAA 〜 TTT -> 4進数 -> 10進数に変換する
    base = DNA.size
    hash_value = str.
      # 文字列を4進数で表現する
      chars.map {|c|
      index = get_dna_index c
      raise "おかしな値 #{c}" if index.nil?
      index
    }.
    # 各桁をそれぞれ10進数にする
    reverse.map.with_index {|n, index|
      # (底 ** 何桁目の値か) * 値
      # 333 -> 63 ((4**2) * 3) + ((4**1) * 3) + ((4**0) * 3)
      (base ** index) * n.to_i
    }.
    # 各桁毎に出した10進数の値を全て足す
    reduce {|memo, item| memo + item }

    #puts @size
    hash_value % @size
  end

  def get_dna_index char
    # 妥協
    DNA.index char
  end

  class LinkList
    def initialize first_value
      @first = Node.new first_value, nil
    end
    def insert key
      new_node = Node.new key, @first
      @first = new_node
    end
    def has? key
      current = @first
      i = 0
      until current.nil?
        i += 1
        if current.key == key
          return true
        else
          current = current.next
        end
      end
      false
    end
    # リンクリスト用のアイテム
    class Node
      def initialize key, next_node
        @key = key
        @next = next_node
      end
      attr_accessor :key, :next
    end
  end
end

def main size, commands
  dic = Dictionary.new size.to_i
  commands.each{|raw_command|
    command, str = raw_command.split ' '
    dic.exec(command, str)
  }
  puts dic.ret.join "\n"
  #dic.container.each {|pii| p pii}
end

array = STDIN.read.split(/\n/)
size = array.shift

main(size, array)
