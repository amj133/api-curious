require 'rails_helper'

describe Repository, type: :model do
  let(:name) { "monkey_malone" }
  subject { Repository.new(name) }

  it "exists and has a name" do
    expect(subject).to be_a(Repository)
    expect(subject.name).to eq("monkey_malone")
  end
end
