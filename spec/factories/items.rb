FactoryBot.define do
    factory :item do
        name { Faker::SiliconValley.character }
        done false
        todo_id nil
    end
end