def greeting
    (1...ARGV.length).map { |arg| puts "#{ARGV[0]} #{ARGV[arg]}" }
end

greeting
