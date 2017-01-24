#write your code here
def echo(word)
    word
end

def shout(word)
    word.upcase
end

def repeat(word, x=2)
    ([word] * x).join(" ")
end

def start_of_word(word, num)
    if num == 1
   return word[num-1]
    elsif num > 1
        return word[0..num-1]
    end
end

def first_word(words)
    arr = words.split(" ")
    return arr[0]
end

def titleize(string)
    little_words = ["and", "or", "the", "over"]
    string = string.split.each do |x|
        x.capitalize! unless little_words.include?x
    end
    string[0].capitalize!
    string = string.join(" ")
end

    