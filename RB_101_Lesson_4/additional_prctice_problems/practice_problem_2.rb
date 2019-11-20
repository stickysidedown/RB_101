ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }


age_sum = 0
ages.map do |key, value|
age_sum += value
end
age_sum


# Or you could write a basic loop:

age_sum = 0
counter = 0
ages_array = ages.values
loop do
break if counter == ages_array.length
current_value = ages_array[counter]
age_sum += current_value
counter +=1
end
age_sum
