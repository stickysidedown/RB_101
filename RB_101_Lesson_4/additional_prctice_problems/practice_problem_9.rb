#Titelize

words = "the flintstones rock"

def titelize(string)
  array = string.split(" ")
  array.map do |word|
    word.capitalize!
  end
  string = array.join(" ")
  string
end

words = titelize(words)
words

