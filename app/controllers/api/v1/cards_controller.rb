class Api::V1::CardsController < ApplicationController
  def index
    cards = current_user.cards
    render json: cards, status: 200
  end

  def show
    card = current_user.cards.find(params[:id])
    render json: card, status: 200
  end

  def create
    card = Card.new(card_params)

    if card.save
      render json: card, status: :created
    else
      render nothing: true, status: :unprocessable_entity
    end
  end

  def update
    card = current_user.cards.find(params[:id])
    if card.update_attributes(card_params)
      render json: card, status: :ok
    else
      render nothing: true, status: :unprocessable_entity
    end
  end

  def destroy
    card = current_user.cards.find(params[:id])
    if card.destroy
      render json: card, status: :ok
    else
      render nothing: true, status: :unprocessable_entity
    end
  end

  def sort
    list = List.find(params[:list_id])
    card_ids = params[:card].map(&:to_i)
    card_ids.each_with_index do |card_id, index|
      Card.find(card_id)
          .update_attributes(position: index + 1, list_id: list.id)
    end
    cards = list.cards.where(id: card_ids)
    render json: cards
  end

  end
  private

    def card_params
      params.require(:card).permit(:assignee_id, :description, :due_date, :list_id, :open, :position, :title, :comments_attributes)
    end
end
