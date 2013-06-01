FactoryGirl.define do


  factory :tictactoe do
  end


  factory :player do
    name          "Jeff"
    win           0
    lose          0
    draw          0
    first_to_act  "true"
    tictactoe
  end

  factory :square do
    sequence(:num, 0) { |n| n }
    value ""
    tictactoe
  end


end

