# Working With BCrypt

## First require bcrypt
```ruby
require 'bcrypt'
```

## Creating a password
```ruby
password = BCrypt::Password.create("Password123")
```

## Checking password
```ruby
if password == "Password123"
 puts "valid password"
else
  puts "invalid password"
end
```
BCyrpt actually overrides the == method in ruby
