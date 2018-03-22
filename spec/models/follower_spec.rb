require 'rails_helper'

describe Follower, type: :model do
  let(:attrs) {
    {
      login: "Frank"
    }
  }
  subject{ Follower.new(attrs) }

  it "exists" do
    expect(subject).to be_a(Follower)
  end

  it "sets attributes with reader methods" do
    expect(subject.login).to eq("Frank")
  end
end
