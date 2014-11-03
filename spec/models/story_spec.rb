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

  describe "custom make functions" do
    it "should make a new story" do
      size_before = Story.all.size
      Story.make("TTH", "Edgar Allen Poe", "blah blah.\n extra extra \n\n blah,,,,,. blah.", 1)
      expect(Story.all.size > size_before).to eq true
    end

    it "should make 2 paragraphs" do
      size_before = Paragraph.all.size
      Story.make("TTH", "Edgar Allen Poe", "blah blah.\n adskfj.", 1)
      expect(Paragraph.all.size).to eq 2
    end

    it "should make 4 sentences" do
      size_before = Sentence.all.size
      Story.make("TTH", "Edgar Allen Poe", "blah blah.\n extra extra. \n\n blah,,,,,. blah.", 1)
      expect(Sentence.all.size - size_before).to eq 4
    end
  end

  describe "validations" do
    it 'requires course' do
      should validate_presence_of(:course_id)
    end
    it 'requires course' do
      should validate_presence_of(:title)
    end
  end
end
