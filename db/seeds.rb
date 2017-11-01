# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

x = 0
while x < 5
  @user = User.new(username: 'user' + x.to_s , email: Faker::Internet.unique.email, password: '123123')
  @user.save
  @post = @user.posts.new(content: Faker::StarWars.quote << ' #' << Faker::Cat.name.downcase)
  @post.save
  # Scan for hashtags
  @tag_array = @post.content.scan(/#\w+\b/)
  # Put loop here
  unless @tag_array == []
    @tag_array.each do |tag|
      @tag = Tag.find_or_initialize_by(name: tag)
      @tag.save
      @post.tags << @tag
    end
  end
  x += 1
end
