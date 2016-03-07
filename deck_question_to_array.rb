f = File.new("deck_questions_help.txt",'r')
new_file = []
f.each_line do |line|
  line = line.split(/[.\?]/).map {|x| x.strip!}
  new_file << line[1..2]
end

arr_count = 1
new_file.each_slice(10) do |arr|
  puts "deck_#{arr_count.to_s} = #{arr}"
  arr_count += 1
end
