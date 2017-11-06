require 'rails_helper'

describe 'cards API' do
  it 'see all cards' do
    create_list(:card, 3)
    get '/api/v1/cards'
    expect(response).to have_http_status(200)
    cards = JSON.parse(response.body)
    card = cards.first


  end

  it 'can get one card by id' do
    id = create(:card).id
    get "/api/v1/cards/#{id}"
    card = JSON.parse(response.body)


  end

  it 'can create an card' do
    card_params = { name: "Summer", description: "Summer Plans", }

    post "/api/v1/cards", params: {card: card_params}
    card = card.last

    assert_response :success

  end

  it 'can update an card' do
    id = create(:card).id
    previous_name = card.last.name
    card_params = { name: "Summer", description: "Summer Plans", }

    put "/api/v1/cards/#{id}", params: {card: card_params}
    card = card.find_by(id: id)

  end

  it 'can delete a card' do
    card = create(:card)
    expect(Card.count).to eq(1)

    delete "/api/v1/cards/#{card.id}"
    expect(response).to have_http_status(:no_content)
    expect{Card.find(card.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
