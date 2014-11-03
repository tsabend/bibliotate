require 'rails_helper'

RSpec.describe Course, :type => :model do
  describe "associations" do

    it 'has many enrollments' do
      should have_many(:enrollments)
    end

    it 'has many users' do
      should have_many(:users)
    end

    it 'belongs to teacher' do
      should belong_to(:teacher)
    end

    it 'has many stories' do
      should have_many(:stories)
    end

  end
end

