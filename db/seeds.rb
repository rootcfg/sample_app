Tgt7.delete_all
1000.times do |time|
    Tgt7.create(
      region: Faker::Number.between(from: 1, to: 20), 
      month: Faker::Date.between(from: '2020-01-01', to: '2021-01-01'),
      count: Faker::Number.number(digits: 5),
      supply_amount_sum: Faker::Number.number(digits: 11),
      buying_amount_sum: Faker::Number.number(digits: 11)
    )
end