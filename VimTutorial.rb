
require "rainbow"
require "./models/User"
require "./Routes"
require "./models/Pages"

# page = Page.new("main",["Lessons","User info","Save & Quit"])
# page.save
# page = Page.new("Lessons",["Cursor movement",'Modes','Commands','Back'])
# page.save
# page = Page.new("Cursor movement",["Learn",'Excercise','Back'])
# page.save
# page = Page.new("Modes",["Learn",'Excercise','Back'])
# page.save
# page = Page.new("Commands",["Learn",'Excercise','Back'])
# page.save
# page = Page.new("User info",['Back'])
# page.save


# print "Enter user name: "
# name = gets.chomp

# if user = User.find(name) 
#     puts "Wellcome back "+Rainbow("#{user.name}").color(user.colour)+"!"
# else
#     puts "[(1)Red, (2)Green, (3)Yellow, (4)Blue, (5)Purple, (6)Light blue]"
#     print "Welcome #{name}, whats your favrioute colour: "
#     colour = gets.downcase.chomp.to_i
#     user = User.new(name, colour)
#     user.save
# end
main_page = Page.find("main")
main_page.cursor = Routes::menu(main_page) while main_page.cursor != nil