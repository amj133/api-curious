require 'rails_helper'

describe Commit, type: :model do
  let(:name) { "monkey man"}
  let(:url) { "https://monkeys-rock.com"}
  subject{ Commit.new(name, url) }

  it "exists and has a url" do
    expect(subject).to be_a(Commit)
    expect(subject.name).to eq("monkey man")
    expect(subject.url).to eq("https://monkeys-rock.com")
  end
end
