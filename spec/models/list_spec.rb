require 'rails_helper'

describe List do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a board" do
        list = List.new(title: "To-Do's")
        expect(list).to_not be_valid
      end

      it "is invalid without a title" do
        list = List.new(board_id: 1)
        expect(list).to_not be_valid
      end
    end

    context "valid attributes" do
      it "is valid with a board" do
        board = Board.new(id: 1, name: "Chores", description: "a list of daily chores")
        list = List.new(board_id: board.id, title: "To-Do's")
        expect(list).to be_valid
      end

      it "is valid with a title" do
        board = Board.new(id: 1, name: "Chores", description: "a list of daily chores")
        list = List.new(board_id: board.id, title: "To-Do's")
        expect(list).to be_valid
      end
    end
  end
end
