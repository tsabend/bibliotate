require 'rails_helper'

RSpec.describe Enrollment, :model => :enrollment do
  describe "associations" do

    it 'belongs to a user' do
      should belong_to(:user)
    end

    it "belongs to a course" do
      should belong_to(:course)
    end

    it "has many notifications" do
      should have_many(:notifications)
    end

  end
end
