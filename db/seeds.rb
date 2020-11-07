# rails g model Tutor first_name:string last_name:string email:string password_digest:string resume:text zoom_link:string rating:integer puppets:boolean --no-test-framework
# rails g model Student first_name:string last_name:string email:string password_digest:string about_me:text level:integer gold_stars:integer helicopter_parent:boolean --no-test-framework
# rails g model Appointment date_time:datetime tutor:belongs_to student:belongs_to --no-test-framework

# need to find better photos for: big bird, and miss piggy (maybe kermit and fozzy as well)

User.delete_all
Appointment.delete_all

MUPPETS = [
    {first_name: "Big", last_name: "Bird", photo: "/photos/big_bird.jpg"},
    {first_name: "Fozzy", last_name: "Bear", photo: "/photos/fozzy_bear.jpg"},
    {first_name: "Gonzo", last_name: "TheGreat", photo: "/photos/gonzo_thegreat.jpg"},
    {first_name: "Kermit", last_name: "Frog", photo: "/photos/kermit_frog.jpg"},
    {first_name: "Miss", last_name: "Piggy", photo: "/photos/miss_piggy.jpg"},
    {first_name: "Dr", last_name: "Beaker", photo: "/photos/dr_beaker.jpg"},
    {first_name: "Professor", last_name: "Bunsen", photo: "/photos/professor_bunsen.jpg"},
    {first_name: "Rizzo", last_name: "Rat", photo: "/photos/rizzo_rat.png"},
    {first_name: "Sam", last_name: "Eagle", photo: "/photos/sam_eagle.jpg"},
    {first_name: "Scoo", last_name: "Ter", photo: "/photos/scoo_ter.jpg"},
    {first_name: "Swedish", last_name: "Chef", photo: "/photos/swedish_chef.png"},
    {first_name: "Mister", last_name: "Animal", photo: "/photos/the_animal.jpeg"}
]

NAMES = [
    "Dee Zaster",
    "Brandon Irons",
    "Val Crow",
    "Skip Roper",
    "Olive Yew",
    "Rusty Carr",
    "Justin Credible",
    "Oliver Sutton",
    "Oren Jellow",
    "Winnie Bago",
    "Jim Sox",
    "Les Moore",
    "Doug Hole",
    "Tish Hughes",
    "Frank Enstein",
    "Warren T.",
    "Crystal Ball",
    "Chip Munk",
    "Mike Stand",
    "Ben Thair",
    "Justin Thyme",
    "Kandi Apple",
    "Rita Story",
    "Pete Moss",
    "Artie Choke",
    "Bob Frapples",
    "Penny Nichols",
    "Ginger Vitis",
    "Phil Rupp",
    "Michelle Lynn",
    "Mort Tallity",
    "Jack Hammer"
]

12.times do | i |
    name = NAMES[i].split(" ")
    Tutor.create(
        id: i + 1,
        first_name: MUPPETS[i][:first_name],
        last_name: MUPPETS[i][:last_name],
        email: "#{MUPPETS[i][:first_name].downcase}_#{MUPPETS[i][:last_name].downcase}@mail",
        password: "password",
        resume: Faker::Lorem.paragraph(sentence_count: 10),
        zoom_link: Faker::Barcode.isbn, 
        rating: rand(1..100),
        puppets: true,
        image: MUPPETS[i][:photo]
    )
end

30.times do | i |
    name = NAMES[i].split(" ")
    Student.create(
        id: i + 13,
        first_name: name[0],
        last_name: name[1],
        email: "#{name[0].downcase}_#{name[1].downcase}@mail",
        password: "password",
        about_me: Faker::Movie.quote,
        level: rand(1..100),
        gold_stars: rand(1..100),
        helicopter_parent: Faker::Boolean.boolean,
        image: "/photos/your_photo.jpg"
    )
end

# binding.pry

100.times do | i |
    Appointment.create(
        id: i + 1,
        date_time: Faker::Time.between_dates(from: Date.today + 10, to: Date.today + 40, period: :day),
        tutor_id: rand(1..12),
        student_id: rand(11..40)
    )
end