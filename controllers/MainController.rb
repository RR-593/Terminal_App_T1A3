require_relative '../views/reference_views'

module MainController
  def self.display_page(cursor, page)
    cls
    case page.name
    when 'User info'
      page.content = Views::Pages.user_info
    end
    Views::Page.main(cursor, page)
  end

  def self.change_name
    print "\nEnter user new name: "
    $user.name = gets.chomp

    $user.save
  end

  def self.change_colour
    name = $user.name
    Views::User.changecolour(name)

    colour = gets.downcase.chomp

    colour = colour.chr =~ /[^0-9]/ ? colour.to_sym : $colours[colour.chr.to_i - 1]

    $user.colour = colour
    $user.save
  end

  def self.delete_user
    $user.name = 'Deleted'
    $user.colour = :white
    $user.save
  end
end
