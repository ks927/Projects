require "Caesar_Cipher"

describe "caesar_cipher" do
    it "shifts a letter by a given value" do
        expect(caesar_cipher("a", 3)).to eql("d")
    end
    
    it "shifts a string by a given value" do
        expect(caesar_cipher("aaa", 3)).to eql("ddd")
    end
    
    it "leaves for uppercase and lowercase intact" do
        expect(caesar_cipher("aBcD", 3)).to eql("dEfG")
    end
    
    it "leaves for special case characters intact" do
        expect(caesar_cipher("abc!", 3)).to eql("def!")
    end
    
    it "accounts for spaces in the string" do
        expect(caesar_cipher("What a string!", 3)).to eql("Zkdw d vwulqj!")
    end
    
    it "wraps from the end of the alphabet to the beginning" do
        expect(caesar_cipher("zzz", 1)).to eql("aaa")
    end
    
end

=begin
require "Caesar_Cipher"

describe 'caesar_cipher' do
    context "given a lowercase string and a positive number" do
        
        context "given 'aaa', 3" do
            it "returns 'ddd'" do
                expect('caesar_cipher'("'aaa', 3")).to eql("ddd")
        end
    end
end
=end