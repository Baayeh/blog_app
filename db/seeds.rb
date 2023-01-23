# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = User.create(name: 'Michael Johnson', photo: "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80", bio: "Enjoys spending time with family, going to car shows, and working on cars in his garage. Also interested in new technology, always looking for ways to improve his home and work life. I am a fitness enthusiast, who likes to stay active by going to the gym and playing sports.")

# post = Post.create(author: user, title: 'Hello man!!', text: 'This is my original post')

# comment = Comment.create(author: user, post: post, text: 'Hi Kwasi!' )

# like = Like.create(post: post, author: user)