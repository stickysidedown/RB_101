flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index do |name, index|
  if name.include?("Be")
    p index
  end
end

# Or this

flintstones.index {|name| name[0..2] == "Be"}

