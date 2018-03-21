require 'rails_helper'

describe Starred, type: :model do
  let(:full_name) { "Spider Steve" }
  subject { Starred.new(full_name) }

  it "exists and has a full name" do
    expect(subject).to be_a(Starred)
    expect(subject.full_name).to eq("Spider Steve")
  end
end
