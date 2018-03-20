require 'rails_helper'

describe Repository, type: :model do
  let(:name) { "monkey_malone" }
  subject { Repository.new(name) }

  it "exists" do
    expect(subject).to be_a(Repository)
  end
end
