require 'rails_helper'

RSpec.describe Sentence, :type => :model do
  describe "associations" do
    it 'has many comments' do
      should have_many(:comments)
    end

    it 'belongs to a paragraph' do
      should belong_to(:paragraph)
    end

  end
end
