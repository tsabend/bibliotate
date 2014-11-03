require 'rails_helper'

RSpec.describe Paragraph, :type => :model do
  describe "associations" do
    it 'belongs to a story' do
      should belong_to(:story)
    end

    it 'has many sentences' do
      should have_many(:sentences)
    end
  end
end
