require 'rails_helper'

describe Following, type: :model do
  let(:username) { "Gorilla Glen" }
  subject {Following.new(username)}

  it "exists and has a username" do
    expect(subject).to be_a(Following)
    expect(subject.username).to eq("Gorilla Glen")
  end
end
