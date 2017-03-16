module Enumerable
    def my_each
        i = 0
        while i < self.length
            yield(self[i])
            i +=1
        end
        self
    end

    def my_each_with_index
        i = 0
       while i < self.length
           yield(self[i], i)
           i += 1
       end
        self
    end

    def my_select
        select = []
        i = 0
        while i < self.length
           self.my_each do |i|
            if yield i
               select.push(i)
            i += 1
            end
        end
        select
    end

    def my_all?
        check = true
        self.my_each do |i|
            check = false unless yield i
        end
        check
    end

    def my_any?
        check = false
        self.my_each do |i|
            if yield i
                check = true
            end
            check
        end
    end

    def my_none?
       check = true
        self.my_each do |i|
            if yield i
                check = true
            end
            check
        end
    end

    def my_count
        count = 0
        self.my_each do |i|
            if block_given?
                if yield(i) == true
                count += 1
                end
            else
            count += 1
            end
        end
        count
    end

    def my_map
        mapped = []
        self.my_each do |i|
            if yield i
                mapped.push(i)
            end
            mapped
        end
    end


    end
    


end
