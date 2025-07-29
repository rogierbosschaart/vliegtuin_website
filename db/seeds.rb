User.destroy_all

User.create!(
  email: 'admin@test.com',
  password: '123123',
  password_confirmation: "123123",
  naam: "Rogier Bosschaart",
  admin: true,
  invitation_accepted_at: Time.current
)

User.create!(
  email: 'user@test.com',
  password: '123123',
  password_confirmation: "123123",
  naam: "Auke Cornelissen",
  admin: false,
  invitation_accepted_at: Time.current
)

User.create!(
  email: 'user1@test.com',
  password: '123123',
  password_confirmation: "123123",
  naam: "Naald & Hamer",
  admin: false,
  invitation_accepted_at: Time.current
)

User.create!(
  email: 'user2@test.com',
  password: '123123',
  password_confirmation: "123123",
  naam: "Sietse van der Woude",
  admin: false,
  invitation_accepted_at: Time.current
)

User.create!(
  email: 'user3@test.com',
  password: '123123',
  password_confirmation: "123123",
  naam: "Bill Rietveld",
  admin: false,
  invitation_accepted_at: Time.current
)

User.create!(
  email: 'user4@test.com',
  password: '123123',
  password_confirmation: "123123",
  naam: "Chiara Zoe",
  admin: false,
  invitation_accepted_at: Time.current
)

User.create!(
  email: 'user5@test.com',
  password: '123123',
  password_confirmation: "123123",
  naam: "Olly deJeu",
  admin: false,
  invitation_accepted_at: Time.current
)

User.create!(
  email: 'user6@test.com',
  password: '123123',
  password_confirmation: "123123",
  naam: "Arend Sr",
  admin: false,
  invitation_accepted_at: Time.current
)

User.create!(
  email: 'user8@test.com',
  password: '123123',
  password_confirmation: "123123",
  naam: "Arend Jr",
  admin: false,
  invitation_accepted_at: Time.current
)

User.create!(
  email: 'user9@test.com',
  password: '123123',
  password_confirmation: "123123",
  naam: "Simcha",
  admin: false,
  invitation_accepted_at: Time.current
)

User.create!(
  email: 'user10@test.com',
  password: '123123',
  password_confirmation: "123123",
  naam: "Jochem",
  admin: false,
  invitation_accepted_at: Time.current
)

User.create!(
  email: 'user11@test.com',
  password: '123123',
  password_confirmation: "123123",
  naam: "Jurrit van Beest",
  admin: false,
  invitation_accepted_at: Time.current
)

User.create!(
  email: 'user12@test.com',
  password: '123123',
  password_confirmation: "123123",
  naam: "Tanya Simic",
  admin: false,
  invitation_accepted_at: Time.current
)

# About.destroy_all

# About.create!(
#   slogan: "Culturele Vrijplaats",
#   second_slogan: "Ruimte voor kunst, ambacht en vrije makers",
#   first_info: "Op de rand van oud en nieuw Noord biedt vrijplaats De Vliegtuin al bijna 10 jaar ruimte aan vrije kunstenaars en ambachtslieden. Het achter de bomen verborgen terrein bied ruimte aan 25 ateliers, gevuld met nog veel meer maakbedrijven. Samen brengen zij ambacht terug in een snel groeiende woonwijk waar niet zo lang geleden ambacht en kleine bedrijvigheid bloeiden.",
#   second_info: "De Vliegtuin is een culturele vrijplaats in Amsterdam-Noord, waar kunstenaars en ambachtslieden samenkomen om te creëren en te innoveren. Met een focus op duurzaamheid en gemeenschap, biedt De Vliegtuin een unieke ruimte voor kunst en cultuur.",
#   third_slogan: "Een andere kijk op de stad"
# )

# NewsItem.destroy_all
