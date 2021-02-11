require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs 
(the `it` statements without blocks)! 
Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("Gaston") }

  subject(:dessert) { Dessert.new('Flan', 12, chef) }
  subject(:bad_dessert) { Dessert.new('Spinach', 'A Gross', 'Matt')}

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq('Flan')
    end
    it "sets a quantity" do
      expect(dessert.quantity).to eq(12)
    end
    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end
    it "raises an argument error when given a non-integer quantity" do
      expect { bad_dessert }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before(:each) do 
      dessert.add_ingredient('eggs')
      dessert.add_ingredient('cream')
      dessert.add_ingredient('butter')
    end

    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients).to eq(['eggs', 'cream', 'butter'])
    end
  end

  describe "#mix!" do
    before(:each) do
      dessert.add_ingredient('eggs')
      dessert.add_ingredient('cream')
      dessert.add_ingredient('butter')
      dessert.add_ingredient('sugar')
      dessert.mix!
    end

    it "shuffles the ingredient array" do
      expect(dessert.ingredients.count).to eq(4)
      expect(dessert.ingredients).to include('eggs')
      expect(dessert.ingredients).to include('cream')
      expect(dessert.ingredients).to include('butter')
      expect(dessert.ingredients).to include('sugar')
      expect(dessert.ingredients).not_to eq(['eggs', 'cream', 'butter', 'sugar'])
    end
  end

  describe "#eat" do
    before(:each) do
      dessert.eat(4)
    end

    it "subtracts an amount from the quantity" do
      expect(dessert.quantity).to eq(8)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(12) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Gaston")
      expect(dessert.serve).to eq("Gaston has made 12 Flans!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake)
    end
  end

end
