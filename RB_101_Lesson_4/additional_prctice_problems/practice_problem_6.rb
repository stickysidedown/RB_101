flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

array = []
array = flintstones.map { |name| name.slice(0..2) }

p array


# Or

flintstones.map! {|name| name[0, 3]}
p flintstones


