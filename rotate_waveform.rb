waves = ["saw", 'square', 'triangle']

loop do 
  waves.each do |wave|
    10.times do |partials|
      system "ruby waveform.rb #{wave} #{partials+1}"
      sleep 0.5
    end
    sleep 0.5
  end
end
