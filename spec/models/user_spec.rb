require "rails_helper"

RSpec.describe User do
  describe "validations" do
    let(:user) do
      described_class.new(name: "user name", 
                          email: "test@test.com",
                          password: "passwd")
    end

    it "should fail if name is nil" do
      expect(user).to be_valid

      user.name = nil
      expect(user).not_to be_valid 
    end

    it "should fail if email is null or invalid" do
      expect(user).to be_valid

      user.email = nil
      expect(user).not_to be_valid

      user.email = "invalid email string"
      expect(user).not_to be_valid
    end

    it "should fail if password is null" do 
      expect(user).to be_valid

      user.password = nil
      expect(user).not_to be_valid

      user.email = "123"
      expect(user).not_to be_valid
    end
  end
end
