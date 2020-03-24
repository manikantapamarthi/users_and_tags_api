# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
```ruby
ruby >= 2.6.1
```
* Bundle install
```
bundle install
```
* Create database & Migrate
```ruby
rake db:create db:migrate db:seed
```
* Create rake secreat
```
bundle exec rake secret
```
* Export the generated secret_key
```
export DEVISE_SECRET_KEY=above_generate_secret_key
```
* For ` sign in ` request

```http
http://localhost:3000/users/sign_in
```
> required params ` email ` and ` password ` 
```json
{
  "user":{
	  "email": "test@gmail.com",
	  "password": "password"
  }
}
```
* after successfull signin request, copy the token from Authorization header and send along with all the requests

> as  ` Bearer your_token`

* For list of users
```http
GET http://localhost:3000/api/v1/users
```

* To Create user
```http
POST http://localhost:3000/api/v1/users
```

* Sample user Object for creation

```json
{
	"user": {
		"email": "test@test.com",
		"name": "test name",
		"password": "password",
		"tags": tag1, tag2 #comma separated string

	}
}
```
* For update user
```http
PUT http://localhost:3000/api/v1/users/:id
```
* To disable the user add disabled to user object
```http
PUT http://localhost:3000/api/v1/users/:id/deactivate
```
```json
disabled: true
```
* For list of tags
```http
GET http://localhost:3000/api/v1/tags
```
* To create new tag
```http
POST http://localhost:3000/api/v1/tags
```
* sample Tag Object for creation

```json
{
	"tag": {"name": "special"}
}
```

* To update tag
```http
PUT http://localhost:3000/api/v1/tags/:id
```

* To search users
> search with email or name
```http
GET http://localhost:3000/api/v1/users?search=query
```
* To sort users
```http
GET http://localhost:3000/api/v1/users?sorty_by=field_name&order_by=asc
```
* To search tags
> search with name
```http
GET http://localhost:3000/api/v1/tags?search=query
```
* To sort tags
```http
GET http://localhost:3000/api/v1/tags?sort_order=asc
```

