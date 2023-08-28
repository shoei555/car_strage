FactoryBot.define do
  factory :user do
    employee_num             {'111111'}
    last_name                {'山田'}
    first_name               {'太郎'}
    email                    {'test@example'}
    password                 {'777777'}
    encrypted_password       {'password'}
  end
end