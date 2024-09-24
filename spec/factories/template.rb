
FactoryBot.define do
  factory :template, class: Hash do
    name { 'sveltejs' }
    repo { 'sveltejs/template' }
    created_at { Time.parse('2024-03-30 12:00:00 -03:00') }

    initialize_with { attributes }
  end
end
