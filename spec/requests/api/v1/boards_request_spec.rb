require 'rails_helper'

describe 'Boards API' do
  it 'see all boards' do
    create_list(:board, 3)

    get '/api/v1/boards'

    expect(response).to have_http_status(200)

    boards = JSON.parse(response.body)
    board = boards.first

    expect(boards.count).to eq(3)
    expect(board).to have_key 'name'
    expect(board).to have_key 'description'
    expect(board).to_not have_key(:created_at)
    expect(board).to_not have_key(:updated_at)
  end

  it 'can get one board by id' do
    id = create(:board).id

    get "/api/v1/boards/#{id}"

    board = JSON.parse(response.body)

    expect(response).to have_http_status(200)
    expect(board["id"]).to eq(id)
    expect(board).to have_key 'name'
    expect(board).to have_key 'description'

    expect(board).to_not have_key(:created_at)
    expect(board).to_not have_key(:updated_at)
  end

  it 'can create an board' do
    board_params = { name: "Summer", description: "Summer Plans", }

    post "/api/v1/boards", params: {board: board_params}
    board = board.last

    assert_response :success

    expect(response).to have_http_status(:created)
    expect(board.name).to eq(board_params[:name])
    expect(board.description).to eq(board_params[:description])

    expect(board).to_not have_key(:created_at)
    expect(board).to_not have_key(:updated_at)
  end

  it 'can delete an board' do
    board = create(:board)
    expect(board.count).to eq(1)
    delete "/api/v1/boards/#{board.id}"

    expect(response).to have_http_status(:no_content)
    expect{board.find(board.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end
