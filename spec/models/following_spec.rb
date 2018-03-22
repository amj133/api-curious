require 'rails_helper'

describe Following, type: :model do
  let(:attrs) {
    {
      login: "Gorilla Glen"
    }
  }
  subject {Following.new(attrs)}

  it "exists" do
    expect(subject).to be_a(Following)
  end

  it "sets attributes with reader methods" do
    expect(subject.username).to eq("Gorilla Glen")
  end
end
