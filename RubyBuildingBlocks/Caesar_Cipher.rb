def caesar_cipher(string, num)
    cipher = ""

    string.each_char do |ch|
      ch = ch.ord
      if ch.between?(97, 122)  || ch.between?(65, 90)
      ch += (num % 26)
        if ch > 122 || (ch > 90 && ch < 97)
          return ch -= 26
        end
      end
      ch = ch.chr
      cipher += ch
    end
    puts cipher
end
