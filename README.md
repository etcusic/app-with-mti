# README

ruby 2.6.1
rails 6.0.3

To use this app, clone the repository and run the following commands in your CLI:
- bundle install 
- rake db:migrate
- rails s
- (to initialize the seed data, type in 'rake db:seed' into your console)

(this application was created and run on a Mac)

Assuming everything installs and runs correctly, copy and paste http://localhost:3000 into your browser's address bar, which should take you to the landing page. From there, click on either "Create Profile" or "Log in with Facebook" to get started as a tutor or a student!

License: https://github.com/etcusic/app-with-mti/blob/master/LICENSE.md

CHECKLIST:
[x] Generate resource User as single table inheritance -> Tutor and Student inherit from User
[x] User model -> validates :first_name, :last_name, :email, has_secure_password - email is unique and validates correct format
[x] Tutor and Student models -> inherit from User; has_many appointments and has_many through: each other
[x] Appointment model -> belongs_to :student && belongs_to :tutor - set up standardized :datetime
[x] ApplicationController -> home_page; before_action: require_login, validate_user; helper_methods: current_user, logged_in?, users_stuff?
[x] SessionsController -> (native login and omniauth-facebook) - new, create, create_with_omniauth, destroy
[x] UsersController -> new, create, show, edit (direct to tutor or student), destroy
[x] Tutors & Students Controllers -> index, edit, update
[x] AppointmentsController -> basic CRUD
[x] views/layouts/application -> if flash.any?, footer partial (links according to page)
[x] views/partials -> _footer; _flash; _user_errors
[x] views/application/home -> welcome page, photo, links to get started
[x] views/sessions -> new; new_with_omniauth
[x] views/users -> new; show (pull from tutors and students partials) - display all appointments, link to create new appt
[x] views/tutors -> _profile; _public; edit; index
[x] views/students -> _profile; _public; edit; index
[x] views/appointments -> new; edit; show

ADDDITIONAL FUNCTIONALITY:
[ ] Availability model -> belongs_to tutor, all the same attrs as Appointment except doesn't belong to Student (basically a premade appt that a student can select)
[ ] AvailabilitiesController -> basic CRUD
[ ] views/availabilities -> new; index (scoped according to Tutor)
[ ] validate Appointment and Availability - no overlap for tutors or students
[ ] Comment model -> belongs_to appointment
[ ] CommentsController -> index, new, create, show, destroy
[ ] views/partials/_comment -> put in appointments/show page
[ ] Message model -> belongs_to tutor and student
[ ] MessagesController -> index, new, create, show, destroy
[ ] views/messages -> index; new; show

CSS:
[ ]
[ ]
[ ]
[ ]
[ ]
[ ]
[ ]
[ ]
[ ]
[ ]
[ ]
[ ]
[ ]