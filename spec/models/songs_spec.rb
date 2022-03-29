require "rails_helper"

RSpec.describe Song do
  describe "validations" do
    it "should fail if title is nil"
    it "should fail if color or cover_image is nil"
    it "should fail if link is nil or invalid"
  end

  describe "associations" do
    it "should have an artist"
    it "should have an album"
  end
end
