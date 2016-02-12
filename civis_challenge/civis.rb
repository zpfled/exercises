# 1. Take an integer and returns a list of its digits 312 -> [3,1,2]
# (optionally, without converting to string)

def split_number(n)
  n.to_s.scan(/\d/).map(&:to_i)
end

p split_number(312) == [3, 1, 2]

# 2. Count the number of occurrences of the word ‘and’ in the following string:
sentence = "Come and show me another city with lifted head singing so proud to be alive and coarse and strong and cunning...proud to be Hog Butcher, Tool Maker, Stacker of Wheat, Player with Railroads and Freight Handler to the Nation."

def word_counter(string, word)
  string.count(word)
end

p word_counter(sentence, 'and') == 42


# 3. Turn a list into a palindrome, i.e. it should read the same both
# backwards and forwards. For example, given the list [1,2,3], your function
# should return [1,2,3,3,2,1]

def palindromize(list)
  list + list.reverse
end

p palindromize([1, 2, 3]) == [1,2,3,3,2,1]