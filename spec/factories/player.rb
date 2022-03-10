FactoryBot.define do
  factory :player, class: 'Player' do
    name { 'Player name' }
    position { 'defender' }

    trait :with_team do
      before :create do |player|
        player.team = create(:team)
      end
    end
  end
end
