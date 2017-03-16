def caesar_cipher(string, num)
    cipher = ""

    string.each_char do |ch|
        ch = ch.ord
        if ch.between?(97, 122)  || ch.between?(65, 90)
            ch += (num % 26)
        elsif ch > 122 || ch.between?(90, 97)
            ch -= (num % 26)
        end
        ch = ch.chr
        cipher << ch
    end
    return cipher
    
end

# UPCASE = 65-90
# downcase = 97-122