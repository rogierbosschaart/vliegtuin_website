User.destroy_all

User.create!(
  email: 'admin@test.com',
  password: '123123',
  password_confirmation: "123123",
  naam: "Rogier",
  admin: true,
  invitation_accepted_at: Time.current
)

User.create!(
  email: 'user@test.com',
  password: '123123',
  password_confirmation: "123123",
  naam: "Bennie",
  admin: false,
  invitation_accepted_at: Time.current
)

# About.destroy_all

# About.create!(
#   slogan: "Culturele Vrijplaats",
#   second_slogan: "Ruimte voor kunst, ambacht en vrije makers",
#   first_info: "Op de rand van oud en nieuw Noord biedt vrijplaats De Vliegtuin al bijna 10 jaar ruimte aan vrije kunstenaars en ambachtslieden. Het achter de bomen verborgen terrein bied ruimte aan 25 ateliers, gevuld met nog veel meer maakbedrijven. Samen brengen zij ambacht terug in een snel groeiende woonwijk waar niet zo lang geleden ambacht en kleine bedrijvigheid bloeiden.",
#   second_info: "De Vliegtuin is een culturele vrijplaats in Amsterdam-Noord, waar kunstenaars en ambachtslieden samenkomen om te creëren en te innoveren. Met een focus op duurzaamheid en gemeenschap, biedt De Vliegtuin een unieke ruimte voor kunst en cultuur."
# )

# NewsItem.destroy_all
# NewsItem.create!(
#   title: "De Vliegtuin bestaat 10 jaar!",
#   info: "De Vliegtuin bestaat 10 jaar! We vieren dit met een groot feest op 16 september. Kom je ook?",
#   slogan: "Vier met ons mee!",
#   selected: true
# )
