require 'rails_helper'

describe Card do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a list" do
        card = Card.new(title: "Title")
        expect(card).to be_invalid
      end

      it "is invalid without a title" do
        card = Card.new(list_id: 1)
        expect(card).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a list" do
        card = Card.new(list_id: 1, title: "Title")
        expect(card).to be_valid
      end

      it "is valid with a title" do
        card = Card.new(list_id: 1, title: "Title")
        expect(card).to be_valid
      end
    end
  end
end
