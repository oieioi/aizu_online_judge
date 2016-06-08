# 荷物がトラックに乗り切るかテストする
def can_load? baggages, track_size, max_weight
  baggages = baggages.dup
  track_count = 1

  #puts "最大トラック数が#{track_size}のとき一台あたりの積載量#{max_weight}"
  baggages.reduce(0) {|last, item|
    #puts "のせる: #{last}"
    weight = last + item
    # 載り切らなかったら次のトラックに載せる
    if weight > max_weight
      track_count += 1
      #puts "トラック数追加 #{track_count}"
      next item
    end

    # まだ載せられるなら次の荷物も載せる
    weight
  }

  track_count <= track_size
end

def search baggages, track_size
  min = baggages.max
  max = baggages.reduce(0) {|sum, item| sum + item}
  (min..max).each {|min_weight| 
    can_load = can_load? baggages, track_size, min_weight
    #puts "つめた？#{can_load}"
    return min_weight if can_load
  }
  raise 'へん'
end

# 最小値は与えられる荷物の重さの最大値

# 最大値は全ての和

def main
  array = STDIN.read.split(/\n/)
  baggage_size, track_size = array.shift.split(' ').map{|s|s.to_i}
  baggages = array.map{|s|s.to_i}
  puts search baggages, track_size
end

main
