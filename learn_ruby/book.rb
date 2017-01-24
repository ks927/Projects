class Book
# write your code here
    attr_accessor :title
    
    def title
        words = ["a", "an", "the", "and", "in", "of"]
    @title = @title.split.each do |x|
        x.capitalize! unless words.include?x
    end
    @title[0].capitalize!
    @title = @title.join(" ")
    end
end
