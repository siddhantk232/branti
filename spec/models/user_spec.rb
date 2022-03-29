# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string           not null
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  uid                    :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
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

  describe "associations" do
    it "should have many songs"
    it "should have many albums"
  end
end
