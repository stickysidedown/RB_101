munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

 munsters.map do |index, key|
  case munsters[index]["age"]
  when 0...17
  munsters[index]["age_group"] = "kid"
  when 18...65
  munsters[index]["age_group"] = "adult"
  else
  munsters[index]["age_group"] = "senior"
  end
 end

 puts munsters
