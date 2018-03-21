require 'rails_helper'

describe Follower, type: :model do
  let(:username) { "Frank" }
  subject{ Follower.new(username) }

  it "exists and has a username" do
    expect(subject).to be_a(Follower)
    expect(subject.username).to eq("Frank")
  end
end
