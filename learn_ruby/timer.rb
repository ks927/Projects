class Timer
  #write your code here
    attr_accessor :seconds
    
    def initialize
        @seconds = 0
    end
    
    def time_string
            seconds = @seconds
            seconds_r = seconds % 60
            minutes = (seconds % 3600) / 60
            hours = (@seconds/3600)
       timer =  "#{padded(hours)}:#{padded(minutes)}:#{padded(seconds_r)}" 
    end
    
    def padded(number)
        if number < 10
            "0#{number}"
            elsif number.to_s.length == 2
            return "#{number}"
        end
    end
end

