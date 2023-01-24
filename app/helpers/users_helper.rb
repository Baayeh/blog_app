module UsersHelper
  def create_single_user(users, name)
    render partial: name, locals: { obj: users } unless users.nil?
  end

  def create_single_post(posts, name)
    render partial: name, locals: { obj: posts } unless posts.nil?
  end
end
