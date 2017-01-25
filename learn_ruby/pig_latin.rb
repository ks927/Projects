#write your code here
=begin
def translate(s)
    vowels = 'aeiou'
    string = s.split(" ")
    phoneme1 = ['ch', 'qu', 'br', 'th']
    phoneme2 = ['sch', 'thr', 'squ']
    newString = ""
    
    string.each do |i|
        if vowels.include?i[0]
            i << "ay"
        elsif
            phoneme2.include?(i[0..2])
            return i[3..-1] + i[0..2] + "ay"
        elsif
            phoneme1.include?(i[0..1])
            return i[2..-1] + i[0..1] + "ay"
        else
            new_ending = i.slice!(0)
            i << new_ending + "ay" 
        end
    end
    string.join(" ")
end
=end
def translate(s)
    vowels = 'aeiou'
    phoneme1 = ['ch', 'qu', 'br', 'th']
    phoneme2 = ['sch', 'thr', 'squ']

string = s.split.each do |i|
    if vowels.include?i[0]
            i << "ay"
          elsif
            phoneme2.include?(i[0..2])
            return i[3..-1] + i[0..2] + "ay"
        elsif
            phoneme1.include?(i[0..1])
            return i[2..-1] + i[0..1] + "ay"
        else
            new_ending = i.slice!(0)
            i << new_ending + "ay" 
        end
    end
    string = string.join(" ")
end