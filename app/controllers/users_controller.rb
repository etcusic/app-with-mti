
# UsersController to do list:
#     - add error messages to User/Tutor/Student models?
#     - create a before_action #valid_request? to check for users accessing what they're allowed (show, edit, update, destroy) - does this go in ApplicationController?
#     - errors for invalid input in #create action
#     - errors for invalid #update
#     - warning for #destroy

# TutorsAndStudentsController
#     - #update => divide into basic user info hash and tutor/student hash
#     - refactor tutor_params and student_params according to what works
#     - revisit routes to trim down what is necessary