require 'rails_helper'

describe Commit, type: :model do
  let(:attrs) {
      {
        commit: {author: {date: "2018-03-19T11:13:53.000-06:00"},
                 message: "initial commit - project setup"},
        repository: {name: "api-curious"}
      }
  }
  subject{ Commit.new(attrs) }

  it "exists" do
    expect(subject).to be_a(Commit)
  end

  it "sets attributes with reader methods" do
    expect(subject.repo_name).to eq("api-curious")
    expect(subject.date).to eq("2018-03-19T11:13:53.000-06:00")
    expect(subject.message).to eq("initial commit - project setup")
  end
end
