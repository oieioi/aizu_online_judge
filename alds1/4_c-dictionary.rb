class Dictionary
  DNA = [''] + %w(A C G T)

  def initialize n
    @size = n
    @container = Array.new(@size)
  end
  attr_accessor :ret

  def exec command, str = ''
    case command
    when 'insert' then insert str
    when 'find'   then puts(find?(str) ? 'yes' : 'no')
    else raise 'へん'
    end
  end

  private

  def insert str
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
    return str.hash % @size
    # 超素朴な実装 (おそすぎ)
    # AGCT -> 4進数 -> 10進数に変換する
    #base = DNA.size
    #size = str.size
    #sum = 0
    #str.chars.each.with_index {|c, index|
    #  # 文字列を4進数で表現する
    #  n = get_dna_index c
    #  # 各桁をそれぞれ10進数にする
    #  # (底 ** 何桁目の値か) * 値
    #  # 各桁毎に出した10進数の値を全て足す
    #  sum += (base ** (size - index)) * n
    #}
    #sum % @size
  end

  def get_dna_index char
    DNA.index char
  end

  # 各ハッシュテーブルに格納するリンクリスト
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
      until current.nil?
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
end

array = STDIN.read.split(/\n/)
size = array.shift

main(size, array)
