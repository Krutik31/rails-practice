class AddDataInAuthorsAndBooks < ActiveRecord::Migration[7.0]
  def up
    author_firstname = ["ankur", "william"]
    author_lastname = ["warikoo", "shakespeare"]
    author_dob = ["31/12/1988", "23/04/1970"]
    author_email = ["warikoo@gmail.com", "Shakespeare@gmail.com"]

    2.times do |i|
      Author.find_or_create_by(first_name: author_firstname[i], last_name: author_lastname[i], dob: author_dob[i], email: author_email[i])
    end

    Author.all.each do |author|
      3.times do |i|
        author.books.find_or_create_by(name: "Book#{i+1} by #{author.first_name}", price: rand(500..1500))
      end
    end

  end

  def down
    Book.delete_all
    Author.delete_all
  end
end
