# CabinFever API

cabinfever.herokuapp.com

API For Cabin Fever final project of THE IRON YARD MAY 2016 - Cabin Fever - Find your ideal cabin experience

## General Rules
User accounts require a first name, last name, email, password, and Date Of Birth (DOB). Email must contain a "@" and "." for successful registration.

### Authorization

All authorized requests unless otherwise mentioned require an "Auth-token" header to be present. Users are assigned an Auth token during account creation.

### Errors

Any request that fails to be processed will contain an "errors" key in the returned JSON describing the problem.

## Routes

#### POST /register

*This route is for managing registration of new users.*

Params:

* first_name: string
* last_name: string
* email: string
* password: string
* address: string
* city: string
* state: string
* zip: string
* phone: string
* dob: string

Returns 200 OK on Success and 422 Unprocessable Entity in case of failure.

**Request**
```
{
	"first_name": "Bob",
	"last_name": "Smith";
	"email:" "Bob@bob.bob",
	"password": "password",
	"address": "104 Main Street"
	"city": "Nowhere",
	"state": "GA",
	"zip": "11134",
	"phone": "555-555-5555",
	"DOB": "April 27, 1980"
}
```

**Response**
```
{
  "first": "Bob",
  "last": "Smith",
  "address": "104 Main Street",
  "city": "Nowhere",
  "state": "GA",
  "zip": "11134",
  "id": 3,
  "email": "bob@bob.co",
  "phone": "555-555-5555",
  "dob": "April 27, 1980",
  "auth_token": "<Generated auth Token>"
}
```

#### POST /login

*This route is for managing logins of existing users.*

Params:

* email: string
* password: string

Returns 200 OK on Success and 422 Unprocessable Entity in case of failure.

**Request**
```
{
	"email:" "Bob@bob.bob",
	"password": "password"
}
```

**Response**
```
{
  "user": {
    "email": "bob@bob.co",
    "auth_token": "<Generated Auth Token>"
  }
}
```


