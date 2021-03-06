[![Build Status](https://travis-ci.org/GetCabinFever/backend.svg?branch=master)](https://travis-ci.org/GetCabinFever/backend)

# CabinFever API

cabinfever.herokuapp.com

API For Cabin Fever final project of THE IRON YARD MAY 2016 - Cabin Fever - Find your ideal cabin experience

## General Rules
User accounts require a first name, last name, email, password, and Date Of Birth (DOB). Email must contain a "@" and "." for successful registration.

### Authorization

All authorized requests unless otherwise mentioned require an "X-Auth-Token" header to be present. Users are assigned an Auth token during account creation.

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
	"email": "Bob@bob.bob",
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

#### GET /residences

*This route is for viewing all residence listings.*

Params:
* None

Returns 200 OK on Success and 401 Unauthorized in case of failure.


#### GET /residences/:id

*This route is for viewing a single residence listing.*

Params:
* Post ID: integer - this comes from the url (:id)

Returns 200 OK on Success and 401 Unauthorized in case of failure.


#### POST /residences

*This route is for creating a new residence listing.*

Params:

* title_of_page: string
* address: string
* city: string
* state: string
* zip: string
* property_type: string
* contact_host_email: string
* base_price: integer
* bedrooms: integer
* bathrooms: integer
* beds: integer
* description_of_listing: string
* house_rules: string
* the_space: string
* guest_access: string
* interaction_with_guests: string
* the_area: string
* other_things_to_note: string
* check_in: date
* check_out: date
* image: (Attached File)
* kitchen: boolean
* internet: boolean
* tv: boolean
* essentials: boolean
* shower_essentials: boolean
* heating: boolean
* airconditioning: boolean
* washer: boolean
* dryer: boolean
* dishwasher: boolean
* free_parking:
* cable: boolean
* satellite: boolean
* breakfast: boolean
* pets: boolean
* kid_friendly: boolean
* events: boolean
* smoking: boolean
* wheelchair_accessible: boolean
* elevator: boolean
* fireplace: boolean
* intercom: boolean
* doorman: boolean
* pool: boolean
* hottub: boolean
* gym: boolean
* hangers: boolean
* iron: boolean
* hair_dryer: boolean
* workstation: boolean
* billiards: false
* smoke: boolean
* co2: boolean
* first_aid: boolean
* safety_card: boolean
* extinguisher: boolean
* fire_alarm: boolean
* gas_shutoff:boolean
* generator: boolean

Returns 200 OK on Success and 422 Unprocessable Entity in case of failure.

**Request**
```
{
  "title_of_page": "Jimmy's Chicken Shack",
  "address": "104 Main Street",
  "city": null,
  "state": "GA",
  "zip": "11134",
  "property_type": "Cabin",
  "contact_host_email": "bob@bob.net",
  "base_price": 185,
  "bedrooms": 3,
  "bathrooms": 3,
  "beds": 5,
  "description_of_listing": "It is a neat cabin in the woods",
  "house_rules": "Have fun, be nice",
  "the_space": "It is huge!",
  "guest_access": "use the key",
  "interaction_with_guests": "email",
  "the_area": "it is an area",
  "other_things_to_note": "the notes are there",
  "check_in": null,
  "check_out": null,
  "boking_url": "airbnb",
  "image": (Attached File),
  "kitchen": true,
  "internet": true,
  "tv": true,
  "essentials": true,
  "shower_essentials": true,
  "heating": true,
  "airconditioning": true,
  "washer": false,
  "dryer": false,
  "dishwasher": false,
  "free_parking": false,
  "cable": false,
  "satellite": false,
  "breakfast": false,
  "pets": false,
  "kid_friendly": false,
  "events": false,
  "smoking": false,
  "wheelchair_accessible": false,
  "elevator": false,
  "fireplace": false,
  "intercom": false,
  "doorman": false,
  "pool": false,
  "hottub": false,
  "gym": false,
  "hangers": false,
  "iron": false,
  "hair_dryer": false,
  "workstation": false,
  "billiards": false
  "smoke": true,
  "co2": true,
  "first_aid": true,
  "safety_card": true,
  "extinguisher": true,
  "fire_alarm": false,
  "gas_shutoff": false,
  "generator": false
```

**Response**
```
{
  "residence": {
    "title_of_page": "Jimmy's Chicken Shack",
    "user_id": 4,
    "address": "104 Main Street",
    "city": null,
    "state": "GA",
    "zip": "11134",
    "property_type": "Cabin",
    "contact_host_email": "bob@bob.net",
    "base_price": 185,
    "bedrooms": 3,
    "bathrooms": 3,
    "beds": 5,
    "description_of_listing": "It is a neat cabin in the woods",
    "house_rules": "Have fun, be nice",
    "the_space": "It is huge!",
    "guest_access": "use the key",
    "interaction_with_guests": "email",
    "the_area": "it is an area",
    "other_things_to_note": "the notes are there",
    "check_in": null,
    "check_out": null,
    "id": 8,
    "booking_url": "airbnb.com"
  },
  "image_url": "http://s3-us-west-2.amazonaws.com/cabin-fever/residences/images/000/000/008/original/clamps.jpg?1461783842",
  "amenities": {
    "kitchen": true,
    "internet": true,
    "tv": true,
    "essentials": true,
    "shower_essentials": true,
    "heating": true,
    "airconditioning": true,
    "washer": false,
    "dryer": false,
    "dishwasher": false,
    "free_parking": false,
    "cable": false,
    "satellite": false,
    "breakfast": false,
    "pets": false,
    "kid_friendly": false,
    "events": false,
    "smoking": false,
    "wheelchair_accessible": false,
    "elevator": false,
    "fireplace": false,
    "intercom": false,
    "doorman": false,
    "pool": false,
    "hottub": false,
    "gym": false,
    "hangers": false,
    "iron": false,
    "hair_dryer": false,
    "workstation": false,
    "billiards": false
  },
  "safeties": {
    "smoke": true,
    "co2": true,
    "first_aid": true,
    "safety_card": true,
    "extinguisher": true,
    "fire_alarm": false,
    "gas_shutoff": false,
    "generator": false
  }
}
```

#### DELETE /residences/:id

*This route is to delete a property listing.*

Params:
* Post ID: integer - this comes from the url (:id)

Returns 200 OK on Success and 401 Unauthorized in case of failure.

#### PUT /residences/:id

*This route is to update a property listing.*

Params:
* Post ID: integer - this comes from the url (:id)

Returns 200 OK on Success and 401 Unauthorized in case of failure.

#### CREATE /residences/:residence_id/guest_books

*This route is to create a guest entry.*

Params:

* entry: string

**Request**
```
{
	"entry": "What a great experience! Lovely little place to stay on a beautiful piece of property. The owners were so accommodating and lovely. The only drawback, I wish I had more time to stay!"
}
```

Returns 200 OK on Success and 422 Unprocessable Entity in case of failure.

**Response**
```
{
  "guest_book": [
    {
      "entry": "What a great experience! Lovely little place to stay on a beautiful piece of property. The owners were so accommodating and lovely. The only drawback-I wish I had more time to stay! ",
      "residence_id": 33,
      "user_id": 3
    }
  ]
}
```

#### PATCH /residences/:id/guest_books/:id

*This route is to update the guest book entry.*

Params:
* Post ID: integer - this comes from the url (:id)

Returns 200 OK on Success and 401 Unauthorized in case of failure.

#### DELETE /residences/:id/guest_books/:id

*This route is to delete a guest book entry*

Params:
* Post ID: integer - this comes from the url (:id)

Returns 200 OK on Success and 401 Unauthorized in case of failure. 

#### POST /residences/search

*This route is to search through all residence listings in the database.*

Params:
Users can search by any one or combination of the following: city, state, zip as search_input

* search_input
* property_type

Returns 200 OK on Success.

**Request**
```
{
  "search_input": "11134"
  "property_type": "Cabin"
}
```

**Response**
```
[
  {
    "image": "<Amazon S3 Generated Image>",
    "city": "Nowhere",
    "state": "GA",
    "zip": "11134",
    "id": 13,
    "property_type": "Cabin",
    "title": "Jimmy's Chicken Shack",
    "accommodates": 8,
    "beds": 4
  },
  {
    "image": "<Amazon S3 Generated Image>",
    "city": "Nowhere",
    "state": "GA",
    "zip": "11134",
    "id": 14,
    "property_type": "Cabin",
    "title": "The Hedge",
    "accommodates": 5,
    "beds": 2
  }
]
```

#### GET /user/dashboard

*This route is to get the current user's dashboard. Current user is determined by the auth token found in the headers under "X-Auth-Token"*

Params:

* current_user

Returns 200 OK on Success.

**Response**
```
[
  {
    "image": "<Amazon S3 image URL>",
    "id": 18,
    "property_type": "Cabin",
    "title": "Jimmy's Chicken Shack"
  },
  {
    "image": "<Amazon S3 image URL>",
    "id": 19,
    "property_type": "Cabin",
    "title": "Frumpy Bumpkins Love Hut"
  },
  {
    "image": "<Amazon S3 image URL>",
    "id": 20,
    "property_type": "Cabin",
    "title": "Rutabaga Flargen Home For Wayward Clowns"
  },
{
```