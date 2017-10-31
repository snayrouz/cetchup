require 'rails_helper'

describe Board do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        board = Board.new(description: "a list of daily chores")
        expect(board).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        board = Board.new(name: "Chores", description: "a list of daily chores")
        expect(board).to be_valid
      end
    end
  end
end
