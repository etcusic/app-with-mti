# rails g model Tutor first_name:string last_name:string email:string password_digest:string resume:text zoom_link:string rating:integer puppets:boolean --no-test-framework
# rails g model Student first_name:string last_name:string email:string password_digest:string about_me:text level:integer gold_stars:integer helicopter_parent:boolean --no-test-framework
# rails g model Appointment date_time:datetime tutor:belongs_to student:belongs_to --no-test-framework

User.delete_all
Tutor.delete_all
Student.delete_all
Appointment.delete_all

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

5.times do | i |
    name = NAMES[i].split(" ")
    Tutor.create(
        id: i + 1,
        # type: Tutor,
        first_name: name[0],
        last_name: name[1],
        email: "#{name[0].downcase}_#{name[1].downcase}@email",
        password: "password",
        resume: Faker::Lorem.paragraph(sentence_count: 4),
        zoom_link: Faker::Barcode.isbn, 
        rating: rand(1..10),
        puppets: Faker::Boolean.boolean
    )
end

25.times do | i |
    name = NAMES[i + 5].split(" ")
    Student.create(
        id: i + 6,
        # type: Student,
        first_name: name[0],
        last_name: name[1],
        email: "#{name[0].downcase}_#{name[1].downcase}@email",
        password: "password",
        about_me: Faker::Movie.quote,
        level: rand(1..100),
        gold_stars: rand(1..50),
        helicopter_parent: Faker::Boolean.boolean
    )
end

binding.pry

# 50.times do | i |
#     Appointment.create(
#         id: i + 1,
#         date_time: Faker::Date.between(from: '2020-11-20', to: '2020-12-20'),
#         tutor_id: rand(1..5),
#         student_id: rand(6..30)
#     )
# end