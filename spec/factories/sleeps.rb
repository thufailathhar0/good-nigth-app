FactoryBot.define do
  factory :sleep do
    user
    clock_in { Faker::Time.between(from: DateTime.now - 5, to: DateTime.now - 2) }
    clock_out { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
  end
end
