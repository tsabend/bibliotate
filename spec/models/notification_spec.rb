require 'rails_helper'

RSpec.describe Notification, :model => :notification do
  describe "associations" do
    it "belongs to a user" do
      should belong_to(:user)
    end

    it "belongs to noteable" do
      should belong_to(:noteable)
    end
  end

  end
end
