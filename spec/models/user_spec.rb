require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "associations" do
    it 'has_many comments' do
      should have_many(:comments)
    end

    it 'has_many enrollments' do
      should have_many(:enrollments)
    end

    it 'has_many courses' do
      should have_many(:enrolled_courses)
    end

    it 'has_many comments' do
      should have_many(:comments)
    end

    it 'has_many notifications' do
      should have_many(:notifications)
    end

  end

  describe "roles" do
    context "as a student" do
      it "should default to a student on create" do
        user = User.create()
        expect(user.role).to eq "student"
      end

      it "should respond false to is_teacher?" do
        user = User.create()
        expect(user.is_teacher?).to eq false
      end
    end

    context "as a teacher" do
      it "should respond true to is_teacher?" do
        user = User.create(role: "teacher")
      end
    end
  end

end
