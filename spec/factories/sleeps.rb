FactoryBot.define do
  factory :sleep do
    user
    clock_in { Faker::Time.between(from: DateTime.now - 5.hours, to: DateTime.now - 2.hours) }
    clock_out { Faker::Time.between(from: DateTime.now - 1.hours, to: DateTime.now) }
  end
end
