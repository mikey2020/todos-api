RSpec.describe 'Todos API', type: :request do
    let!(:todos) { create_list(:todo, 10) }
    let(:todo_id) { todos.first.id }

    describe 'GET /todos' do
        before { get '/todos' }

        it 'returns todos' do
            expect(json).not_to be_empty
            expect(json.size).to eq(10)
        end

        it 'returns status code 200' do
            expect(response).to have_http_status(200)
        end
    end

    describe 'Get /todos/:id' do
        before { get "/todos/#{todo_id}" }

        context 'when the record exists' do
          it 'returns the todo' do
            expect(json).not_to be_empty
            expect(json['id']).to eq(todo_id)
          end
        end

        context 'when the record does not exist' do
            it 'returns status code 404' do
                expect(response).to have_http_status(404)
            end

            it 'returns not found message' do
                expect(response.body).to match(/Couldn't find todo/)
            end
        end
    end

    describe 'POST /todos' do
        let(:valid_attributes) { { title: 'Learn Rust', created_by: '1' } }

        context 'when request is valid' do
            before { post '/todos', params: valid_attributes }

            it 'creates a todo' do
                expect(json['title']).to eq('Learn Rust')
            end

            it 'returns status code 201' do
                expect(response).to have_http_status(201)
            end
        end

        context 'when request is not valid' do
            before { post '/todos', params: {} }

            it 'returns status code 400' do
                expect(response).to have_http_status(400)
            end

            it 'returns validation failure message' do
                expect(response.body).to match(/Title can't be blank/)
            end

        end
    end

    describe 'PUT /todos/:id' do
        let(:valid_attributes) { { title: 'Learn Data Science' } }

        context 'when todo exists' do
            before { put "/todos/#{todo_id}", params: valid_attributes }
            it 'updates todo title' do
                expect(response.body).to be_empty
            end

            it 'returns status code 204' do
                expect(response).to have_http_status(204)
            end
        end
    end

    describe 'DELETE /todos/:id' do

        context 'when todo exists' do
            before { delete "/todos/#{todo_id}"}
            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end
        end
    end
end