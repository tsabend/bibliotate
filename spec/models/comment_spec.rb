require 'rails_helper'

RSpec.describe Comment, :type => :model do
  describe "associations" do
    it 'belongs to a sentence' do
      should belong_to(:sentence)
    end

    it 'belongs to a user' do
      should belong_to(:user)
    end

    it 'has many hastags' do
      should have_many(:hashtags)
    end

    it "has many notifications" do
      should have_many(:notifications)
    end
  end
end
