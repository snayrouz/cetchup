require 'rails_helper'

describe User do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a full_name" do
        user = User.new(email: "sam@sam.com", password: "password")
        expect(user).to be_invalid
      end

      it "is invalid without an email" do
        user = User.new(full_name: "Sam Nayrouz", password: "password")
        expect(user).to be_invalid
      end

      it "is invalid without a password" do
        user = User.new(full_name: "Sam Nayrouz", email: "sam@sam.com")
        expect(user).to be_invalid
      end

      it "is invalid without a unique email" do
        User.create(full_name: "Sam Nayrouz", email: "sam@sam.com", password: "password")
        user = User.new(full_name: "Sam Nayrouz", email: "sam@sam.com", password: "password")
        expect(user).to be_invalid
      end

    end

    context "valid attributes" do
      it "is valid with a full_name, email and password" do
        user = User.new(full_name: "Sam Nayrouz", email: "sam@sam.com", password: "password")
        expect(user).to be_valid
      end
    end
  end
end
