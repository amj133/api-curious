require 'rails_helper'

describe GithubUser do
  let(:attrs) {
    {
      "uid" => 15,
      "info" => { "email" => "monkeysrule@gmail.com", "urls" => {"GitHub" => "https://github.com/amj133"}},
      "extra" =>
        {"raw_info" =>
          {"login" => "monkeysrule",
           "avatar_url" => "https://monkeysrule.com",
           "id" => 31484552,
           "name" => "Monkey Man",
           "location" => "Denver, CO",
           "bio" => "My mother was a wildlife biologist and I love monkeys!"}}
    }
  }
  subject{ GithubUser.new(attrs) }

  it "exists" do
    expect(subject).to be_a(GithubUser)
  end

  it "sets required attributes" do
    expect(subject.uid).to eq(15)
    expect(subject.login).to eq("monkeysrule")
    expect(subject.email).to eq("monkeysrule@gmail.com")
    expect(subject.name).to eq("Monkey Man")
    expect(subject.bio).to eq("My mother was a wildlife biologist and I love monkeys!")
    expect(subject.location).to eq("Denver, CO")
  end
end
