RSpec.describe 'Items API' do
    let!(:todo) { create(:todo) }
    let!(:items) { create_list(:item, 10, todo_id: todo.id) }
    let(:todo_id) { todo.id }
    let(:id) { items.first.id }


    describe 'GET /todos/:todo_id/items' do
        context 'when todo id is valid' do
            before { get "/todos/#{todo_id}/items" }
            it 'returns all items' do
                expect(json).not_to be_empty
                expect(json.size).to eq(10)
            end

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end
        end

        context 'when todo id is invalid' do
            before { get '/todos/100/items' }
            it 'returns staus code 404' do
                expect(response).to have_http_status(404)
            end

            it 'returns a not found message' do
                expect(response.body).to match(/Couldn't find Todo/)
            end
        end
    end

    describe 'GET /todos/:todo_id/items/:id' do
        context 'when todo exists' do
            before { get "/todos/#{todo_id}/items/#{id}" }
            it 'returns the item' do
                expect(json['name']).to eq(items.first.name)
                expect(json['id']).to eq(id)
            end

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end
        end

        context 'when todo does not exist' do
            before { get "/todos/566/items/#{id}" }
            it 'returns staus code 404' do
                expect(response).to have_http_status(404)
            end

            it 'returns a not found message' do
                expect(response.body).to match(/Couldn't find Todo with 'id'=566/)
            end
        end

    end

    describe 'POST /todos/:todo_id/items' do
        let(:valid_attributes) { { name: 'Visit Narnia', done: false } }
    
        context 'when request attributes are valid' do
          before { post "/todos/#{todo_id}/items", params: valid_attributes }
    
          it 'returns status code 201' do
            expect(response).to have_http_status(201)
          end
        end
    
        context 'when an invalid request' do
          before { post "/todos/#{todo_id}/items", params: {} }
    
          it 'returns status code 422' do
            expect(response).to have_http_status(422)
          end
    
          it 'returns a failure message' do
            expect(response.body).to match(/Validation failed: Name can't be blank/)
          end
        end
      end
    
      describe 'PUT /todos/:todo_id/items/:id' do
        let(:valid_attributes) { { name: 'Mozart' } }
    
        before { put "/todos/#{todo_id}/items/#{id}", params: valid_attributes }
    
        context 'when item exists' do
          it 'returns status code 204' do
            expect(response).to have_http_status(204)
          end
    
          it 'updates the item' do
            updated_item = Item.find(id)
            expect(updated_item.name).to match(/Mozart/)
          end
        end
    
        context 'when the item does not exist' do
          let(:id) { 0 }
    
          it 'returns status code 404' do
            expect(response).to have_http_status(404)
          end
    
          it 'returns a not found message' do
            expect(response.body).to match(/Couldn't find Item/)
          end
        end
      end
    
      describe 'DELETE /todos/:id' do
        before { delete "/todos/#{todo_id}/items/#{id}" }
    
        it 'returns status code 204' do
          expect(response).to have_http_status(204)
        end
      end
end