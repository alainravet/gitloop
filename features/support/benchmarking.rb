$timers={}


def record_time_taken(category)
  category = category.to_sym
  $timers[category] ||= [0,0]
  start = Time.now
  res = yield
  time, count = $timers[category]
  $timers[category] = [time + (Time.now - start), count+1]
  res
end

at_exit do
  puts "-"*80
  keylength = $timers.keys.collect(&:length).max
  puts "****                               total   ||    secs/run  ||    runs"
  puts "-"*66
  $timers.keys.each do |key|
    time, count = $timers[key]
    #puts "**** %{key} : total = %{time} sec. || %{count} secs/run || %{loop_time} runs" % {:key => key, :time => time, :count => count, :loop_time => (time/count)}
    puts "**** %#{keylength+1}s : %#7.2f sec. || %7.3f sec. || %3d runs" % [key, time, (time/count), count]
  end
end