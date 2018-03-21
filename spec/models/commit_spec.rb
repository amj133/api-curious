require 'rails_helper'

describe Commit, type: :model do
  let(:url) { "https://monkeys-rock.com"}
  subject{ Commit.new(url) }

  it "exists and has a url" do
    expect(subject).to be_a(Commit)
    expect(subject.url).to eq("https://monkeys-rock.com")
  end
end
