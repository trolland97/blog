namespace :db do
    desc "Adatbázis kiürítése és új adatokkal feltöltése"
    task :populate => :environment do
      require 'populator'
      require 'faker'
      require_relative('populator_fixes.rb')
      
      [User, Post, Comment, Category].each(&:delete_all)
         
      password = "password"

      User.populate 15 do |user|
        user.email    = Faker::Internet.email
        user.encrypted_password = User.new(:password => password).encrypted_password
        Category.populate 1 do |category|
            category.name = Populator.words(1..2).titleize
            category.created_at = 2.years.ago..Time.now
            Post.populate 5 do |post|
                post.title = Populator.words(1..2).titleize
                post.content = Populator.sentences(5..10)
                post.created_at = 2.years.ago..Time.now
                post.user_id = user.id
                Comment.populate 3 do |comment|
                    comment.name = Faker::Name.name
                    comment.comment = Populator.sentences(2...5)
                    comment.post_id = post.id
                    comment.created_at = 2.years.ago..Time.now
                end
            end
        end
      end
    end
  end