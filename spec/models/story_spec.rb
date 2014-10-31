require 'rails_helper'

RSpec.describe Story, :type => :model do
  describe "associations" do
    it 'has_many comments' do
      should have_many(:comments)
    end

    it 'has_many paragraphs' do
      should have_many(:paragraphs)
    end

    it 'has_many sentences' do
      should have_many(:sentences)
    end

    it 'belongs to a course' do
      should belong_to(:course)
    end
  end
end
