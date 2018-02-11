# Ruby SQL Helpers

## Basic table layout
```ruby 
vader = Author.create!(name: "Vader", country: "Mustafar")
luke  = Author.create!(name: "Luke", country: "Tatooine")
leia  = Author.create!(name: "Leia", country: "Alderaan")

fiction     = Genre.create!(name: "Fiction")
non_fiction = Genre.create!(name: "Non-Fiction")
biographies = Genre.create!(name: "Biographies")

Book.create!(title: "The Force", genre_id: non_fiction.id, author_id: luke.id, sales: 500)
Book.create!(title: "Britney Speares: An Anthology", genre_id: biographies.id, author_id: vader.id, sales: 950)
Book.create!(title: "Only One Direction", genre_id: biographies.id, author_id: vader.id, sales: 45)
Book.create!(title: "DIY Deathstar", genre_id: non_fiction.id, author_id: vader.id, sales: 1200)
``` 

## Models
```ruby 
class Author < ApplicationRecord
  has_many :books
  has_many :genres, through: :books
end
```

```ruby
class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre
end
```

```ruby
class Genre < ApplicationRecord
  has_many :books
  has_many :authors, through: :books
end
```

## Has Many Through
#### With the through: attr we can do the following
```ruby
  author = Author.first.genres
```
#### OR
```ruby
  gener = Genre.first.authors
```

## Pluck
```ruby
  gener = Genre.pluck(:name)
```
This will return an array for the Genre names

```ruby
  Auther.first.books.pluck(:title)
```
This will return an array of the Book titles that belong to the first author

## Useful tools

#### Gets Sum of All book sales
```ruby 
Book.sum(:sales) 
```


#### Gets avarage book sales
```ruby 
  Book.avarage(:sales) 
```  


#### Gets maximum Book sales
```ruby 
  Book.maximum(:sales)
```  


#### Gets minimum Book sales
```ruby 
  Book.minimum(:sales) 
```  


#### Get Best selling book
```ruby 
  Book.order('sales DESC').first 
```
