def main inputs
  inputs = inputs.dup
  size, quantum = inputs.shift.split(' ').map{|n|n.to_i}
  time = 0
  done = []
  until inputs.empty?
    target_name, target_rest = inputs.shift.split ' '
    # 残り時間
    rest = target_rest.to_i - quantum

    # 処理が終わる場合
    if rest <= 0
      time = time + target_rest.to_i
      done.push("#{target_name} #{time}")
    else
      # 処理が終わらない場合
      time = time + quantum
      # 積み直し
      inputs.push "#{target_name} #{rest}"
    end
  end
  done.join "\n"
end


inputs = STDIN.read.split(/\n/)

puts main(inputs)
