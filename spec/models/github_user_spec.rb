require 'rails_helper'

describe GithubUser do
  let(:attrs) {
    {
      uid: 15,
      login: "monkeysrule",
      email: "monkeysrule@gmail.com",
      avatar_url: "https://monkeysrule.com",
      name: "Monkey Man"
      bio: "My mother was a wildlife biologist and I love monkeys!"
      location: "Denver, CO"
    }
  }
  subject{ Githubuser.new(attrs) }

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
