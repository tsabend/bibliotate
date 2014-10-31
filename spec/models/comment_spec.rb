require 'rails_helper'

RSpec.describe Comment, :type => :model do
  describe "associations" do
    it 'belongs to a sentence' do
      should belong_to(:sentence)
    end
  end
end
