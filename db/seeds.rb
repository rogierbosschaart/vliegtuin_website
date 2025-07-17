User.destroy_all

User.create!(
  email: 'test@test.com',
  password: '123123'
)

User.create!(
  email: 'test2@test.com',
  password: '123123'
)
