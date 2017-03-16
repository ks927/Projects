require "Enumerables"

describe Enumerable do

    let(:array) { [1,2,3,4] }

    describe "my_each" do
        it "returns this array" do
            expect(array.my_each{ |num| num}).to eql(array)
        end
    end

    describe "select" do
       it "returns array with selected values" do
           expect(array.select{ |item| item < 3  }).to eql([1,2])
       end
    end

    describe "my_count" do
       it "returns size of array" do
          expect(array.my_count).to eql(4)
       end
    end

end
