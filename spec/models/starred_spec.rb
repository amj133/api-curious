require 'rails_helper'

describe Starred, type: :model do
  let(:attrs) {
    {
      full_name: "Spider Steve"
    }
  }
  subject { Starred.new(attrs) }

  it "exists" do
    expect(subject).to be_a(Starred)
  end

  it "sets attributes with reader methods" do
    expect(subject.full_name).to eq("Spider Steve")
  end
end
