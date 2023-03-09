
# Active Record Migrations Practical

### Task 1: Create an author with first name, last name, dob, email.

```
>>> rails g model Author first_name:string last_name:string dob:date email:string

>>> Visit 'db/migrate/20230307045709_create_authors.rb'.

```


### Task 2: Add proper validations.

In Author model class, I have added validations which validates the range of birth date, format of email address as well as it ensures that every field has a value or not.

```
>>> Visit 'app/models/author.rb' for validations.

```


### Task 3: Add a column ‘age’ in the author.

```
>>> rails g migration AddAgeToAuthors age:integer

>>> Visit 'db/migrate/20230307083800_add_age_to_authors.rb'.

```


### Task 4: Remove the column ‘age’ in the author.

```
>>> rails g migration RemoveAgeToAuthors age:integer

>>> Visit 'db/migrate/20230307084212_remove_age_from_authors.rb'.

```


### Task 5: generate model books with ‘name’ and ‘price’. The price must be in decimal.

```
>>> rails g model Book name:string price:decimal

>>> Visit 'app/model/book.rb', 'db/migrate/20230307084422_create_books.rb'.

```


### Task 6: Create a reference with the author. The author has many books.

```
>>> rails g migration AddAuthorRefToBook author:references

>>> in Author model class: 
        has_many :books, dependent: :destroy

>>> in Book model class: 
        belongs_to :author

>>> Visit 'app/model/author.rb', 'app/model/book.rb' & 'db/migrate/20230307085331_add_author_ref_to_books.rb'.

```


### Task 7: Create Data with migration for the author and book.

```
>>> rails g migration Book AddDataInAuthorAndBooks

>>> Visit 'db/migrate/20230307090702_add_data_in_authors_and_books.rb'.

```


### Task 8: Join the table author and books.

```
>>> rails g migration CreateJoinTableAuthorBook author book

>>> Visit 'db/migrate/20230307100311_create_join_table_author_book.rb'.

```


### Task 9: Create any migration with up/down and reversible.
'up' method executed when a perticular migration migrate & 'down' method executed whenever a migration will be rollbacked. 

```
>>> rails g migration AddRemoveAgeFromAuthor

>>> rails g migration AddRemoveAgeReversible

>>> Visit 'db/migrate/20230307111203_add_remove_age_from_author.rb', 'db/migrate/20230307111329_add_remove_age_reversible.rb'.

```


### Task 10: Create data in database(10 records) of Books using seed file, Write code in seed file in a way that similar records should not create twice in DB.

```
>>> Visit 'db/seeds.rb'.

>>> rails db:seed

```


### Task 11: Implement CRUD for all these tables using VIEW. Display data accordingly.




### Task 12: Rename the column to dob to date_of_birth using reversible migrations.

```
>>> rails g migration ChangeDobFromAuthor

>>> Visit 'db/migrate/20230309043533_change_dob_from_author.rb'.

```

### Task 13: Create sql file using schema dump of database.

For creating SQL file of schema using schema dumping, we have to set 'config.active_record.schema_format' parameter as ':sql' inside 'application.rb' file.
```
>>> Visit 'config/application.rb'.

```

