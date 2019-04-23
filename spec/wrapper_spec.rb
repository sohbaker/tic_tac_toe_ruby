class Wrapper
  def self.wrap(string, column_width)
    string
  end
end

RSpec.describe Wrapper do
  it "returns hello when given the string hello" do 
      call_function = Wrapper.wrap("hello", 5)
      expect(call_function).to eq("hello")
  end 

end
