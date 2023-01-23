module UsersHelper
  def create_single_user(users, name)
    render partial: name, locals: { obj: users } if !users.nil?
  end

  def create_single_post(posts, name)
    render partial: name, locals: { obj: posts } if !posts.nil?
  end
end
