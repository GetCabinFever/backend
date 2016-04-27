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
  "check_out": null
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
    "check_out": null
  },
  "image_url": "http://s3-us-west-2.amazonaws.com/cabin-fever/residences/images/000/000/007/original/clamps.jpg?1461773163",
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