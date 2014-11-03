require 'rails_helper'

RSpec.describe Hashtag, :model => :hashtag do
  describe "associations" do
    it "belongs to a user" do
      should belong_to(:user)
    end

    it "belongs to a comment" do
      should belong_to(:comment)
    end
  end
end
