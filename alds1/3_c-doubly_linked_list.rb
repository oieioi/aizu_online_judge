class List
  def initialize
    @first = nil
    @last = nil
  end

  def [] index
    current_item = @first

    # リストをたぐる
    index.times {|item|
      return nil if current_item.next.nil?
      current_item = current_item.next
    }

    current_item
  end

  def insert val
    new_item = ListItem.new val
    link new_item, @first
    @first = new_item
    @last ||= new_item
  end

  def search target
    current_item = @first

    # 早くしたい場合はここをちゃんとしたサーチにする
    loop do
      return nil          if current_item.nil?
      return current_item if current_item.value == target
      current_item = current_item.next
    end
  end

  def delete target
    target_item = search target
    return false if target_item.nil?

    # 削除対象を抜いたリンクにする
    link target_item.prev, target_item.next

    # 削除対象が先頭の時
    @first = target_item.next if target_item.prev.nil?

    # 削除対象が最後の時
    @last = target_item.prev if target_item.next.nil?

    return true
  end

  def delete_first
    return false if @first.nil?
    @first = @first.next
    link nil, @first
    empty if @first.nil?
    true
  end

  def delete_last

    return false if @last.nil?
    @last = @last.prev
    link @last, nil
    empty if @last.nil?
    true
  end

  def print delimiter = ' '
    print_items = []
    current_item = @first
    until current_item.nil?
      print_items << current_item.value
      current_item = current_item.next
    end
    puts print_items.join delimiter
  end

  private

  def link first, second
    first.next = second unless first.nil?
    second.prev = first unless second.nil?
  end

  def empty
    @first = @last = nil
  end

  class ListItem
    def initialize value
      @value = value
      @next = nil
      @prev = nil
    end
    attr_accessor :next, :prev, :value
  end
end

def main commands
  list = List.new

  commands.each do |raw_command|
    #list.print
    command, arg = raw_command.split ' '
    case command
    when 'insert'
      list.insert arg
    when 'delete'
      list.delete arg
    when 'deleteFirst'
      list.delete_first
    when 'deleteLast'
      list.delete_last
    else
      raise 'へん'
    end
  end
  list.print
end


inputs = STDIN.read.split(/\n/)
inputs.shift

main(inputs)
