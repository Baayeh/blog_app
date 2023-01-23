module UsersHelper
  def create_single_user(users, name)
    render partial: name, locals: { obj: users } if !users.nil?
  end
end
