FactoryBot.define do
  factory :user do
    name     { 'testuser' }
    email    { 'test@test.com' }
    password { 'passwd' }
  end
end
