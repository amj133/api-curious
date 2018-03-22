require 'rails_helper'

describe Repository, type: :model do
  let(:attrs) {
    {
      name: "monkey_malone",
      owner: {url: "https://monkey-man.com"}
    }
  }
  subject { Repository.new(attrs) }

  it "exists" do
    expect(subject).to be_a(Repository)
  end

  it "sets attributes with reader methods" do
    expect(subject.name).to eq("monkey_malone")
    expect(subject.url).to eq("https://monkey-man.com")
    expect(subject.starred?).to eq("no")
  end
end
