dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
def substrings(string, dictionary)
    strings = Hash.new(0)


    dictionary.each do |word|
        if string.include?word
            strings[word] = string.scan(word).length
        end
    end
    return strings
end
