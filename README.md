![Ruby](https://img.shields.io/badge/Ruby-v2.7.2-red) ![Rails](https://img.shields.io/badge/Rails-v5.2.6-red) ![bcrypt](https://img.shields.io/badge/bcrypt-3.1.7-red)

Hi, welcome to Sweater Weather! I developed this API independently during my time at Turing's Backend Software Engineering program. The learning goals for this project were as follows:

- [x] Expose an API that aggregates data from multiple external APIs
- [x] Expose an API that requires an authentication token
- [x] Expose an API for CRUD functionality
- [x] Determine completion criteria based on the needs of other developers
- [x] Research, select, and consume an API based on your needs as a developer

I also wrote a README below with the goal of helping other developers consume the various endpoints exposed by this API. This was mostly done for practice, as I don't anticipate other developers actually using this project, but maybe it will help me one day if I ever decide to come back and continue building!

If you have any questions or suggestions about the code itself or the documentation below, please don't hesitate to leave a comment. Thank you!

# README

**Contents:**

[Description](#description)

[Usage](#usage)

[Authentication and Authorization](#authentication-and-authorization)

[Endpoints](#available-endpoints)

## Description

Sweather Weather is a Rails backend API (initialized with the `--api` flag) that provides several endpoints for a hypothetical frontend to consume. It is compliant with the [JSON API spec](https://jsonapi.org/) and could be used to develop a frontend application which provides users with realtime weather data as well as the ability to plan a roadtrip and see forecasted weather in their destination at their estimated time of arrival. To provide this information, the backend application consumes data from the following external APIs:
* [Mapquest Geocoding API](https://developer.mapquest.com/documentation/geocoding-api/)
* [Mapquest Directions API](https://developer.mapquest.com/documentation/directions-api/)
* [OpenWeather Onecall API](https://openweathermap.org/api/one-call-api)
* [Unsplash API](https://unsplash.com/documentation)

## Usage

This repository is not currently hosted online. To use it, you'll need to clone it down to your local machine and run a server locally. Instructions for doing so are below:

* Clone the repository and pull it down onto your local machine. Navigate into the directory where it is saved before continuing.
* From your command line, run the following:
  * `bundle install` to install ruby gem dependencies
  * `rails db:{create,migrate}` to create a local Postgres database and run the necessary migrations
  * `bundle exec figaro install` to create an `application.yml` file where secret API keys can be stored safely. The figaro gem will also automatically add the `application.yml` file to your `.gitignore` to prevent api keys from accidentally being pushed to your version control system.
* If you don't have them already, sign up for API keys using the links above in the description. They'll need to be added to your `application.yml` file with the following names:
  * `mapquest_api_key = <mapquest_api_key>`
  * `one_call_api_key = <one_call_api_key>`
  * `unsplash_api_key = <unsplash_api_key>`
* Once all this is done, you should be ready to spin up your server! `rails s -p 3000` will run the server on `http://localhost:3000`, which becomes your base url for the endpoints below. Use a tool like Postman or another tab of your command line to test different endpoints.

## Authentication and Authorization

Sweater Weather provides one API Key per user upon registration. This key is required to log in and to use the Roadtrip endpoint. Other endpoints are public and free to use without a key. Specific authentication instructions are provided in the Roadtrip endpoint below.

## Available Endpoints

### 1. Weather and Forecast Data for a City

Returns forecasted weather data for a city specified by the **required** query parameter.

```
GET /api/v1/forecast?location=denver,co
Content-Type: application/json
Accept: application/json
```

Example Response:
```
{
    "data": {
        "id": "null",
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2022-01-18 14:34:43 -0700",
                "sunrise": "2022-01-18 07:17:46 -0700",
                "sunset": "2022-01-18 17:02:38 -0700",
                "temperature": 51.39,
                "feels_like": 47.3,
                "humidity": 23,
                "uvi": 0.57,
                "visibility": 10000,
                "conditions": "overcast clouds",
                "icon": "04d"
            },
            "daily_weather": [
                {
                    "date": "2022-01-18",
                    "sunrise": "2022-01-18 07:17:46 -0700",
                    "sunset": "2022-01-18 17:02:38 -0700",
                    "max_temp": 51.39,
                    "min_temp": 34.83,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "date": "2022-01-19",
                    "sunrise": "2022-01-19 07:17:15 -0700",
                    "sunset": "2022-01-19 17:03:46 -0700",
                    "max_temp": 32.95,
                    "min_temp": 25.32,
                    "conditions": "light snow",
                    "icon": "13d"
                },
                {
                    "date": "2022-01-20",
                    "sunrise": "2022-01-20 07:16:43 -0700",
                    "sunset": "2022-01-20 17:04:54 -0700",
                    "max_temp": 38.79,
                    "min_temp": 24.49,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2022-01-21",
                    "sunrise": "2022-01-21 07:16:09 -0700",
                    "sunset": "2022-01-21 17:06:03 -0700",
                    "max_temp": 35.53,
                    "min_temp": 31.5,
                    "conditions": "light snow",
                    "icon": "13d"
                },
                {
                    "date": "2022-01-22",
                    "sunrise": "2022-01-22 07:15:33 -0700",
                    "sunset": "2022-01-22 17:07:13 -0700",
                    "max_temp": 38.44,
                    "min_temp": 28.58,
                    "conditions": "few clouds",
                    "icon": "02d"
                }
            ],
            "hourly_weather": [
                {
                    "time": "14:00:00",
                    "temperature": 50.97,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "time": "15:00:00",
                    "temperature": 51.39,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "time": "16:00:00",
                    "temperature": 50.5,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "time": "17:00:00",
                    "temperature": 48.6,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "time": "18:00:00",
                    "temperature": 46.29,
                    "conditions": "overcast clouds",
                    "icon": "04n"
                },
                {
                    "time": "19:00:00",
                    "temperature": 42.46,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "20:00:00",
                    "temperature": 38.95,
                    "conditions": "scattered clouds",
                    "icon": "03n"
                },
                {
                    "time": "21:00:00",
                    "temperature": 38.37,
                    "conditions": "scattered clouds",
                    "icon": "03n"
                }
            ]
        }
    }
}
```

Attributes within the response:
* `current_weather` - holds current weather data for the specified location:
  * `datetime` (year-month-day hour-minute-second UTC offset) “2020-09-30 13:27:03 -0600”
  * `sunrise` (same formatting as datetime)
  * `sunset` (same formatting as datetime)
  * `temperature` - floating point number indicating the current temperature in Fahrenheit
  * `feels_like` - floating point number indicating a temperature in Fahrenheit
  * `humidity`
  * `uvi`
  * `visibility`
  * `conditions` - a short description of the current weather
  * `icon` - a string pointing to one of several icons from the OpenWeatherAPI
* `daily_weather` - holds the next 5 days of forecasted weather data:
  * `date` (year-month-day)
  * `sunrise`
  * `sunset`
  * `max_temp` - daily high
  * `min_temp` - daily low
  * `conditions`
  * `icon`
* `hourly_weather` - holds the next 8 hours of forecasted weather data:
  * `time` (24 h clock)
  * `temperature`
  * `conditions`
  * `icon`

All temperatures are in Fahrenheit and times use a 24 hour clock, with year-month-day formatting for dates.

### 2. Background Image for a City

Searches for an image related to the city specified by the **required** query parameter.

```
GET /api/v1/backgrounds?location=denver,co
Content-Type: application/json
Accept: application/json
```

Example Response:
```
{
    "data": {
        "id": "null",
        "type": "image",
        "attributes": {
            "image": {
                "location": "'denver,co'",
                "image_url": "https://images.unsplash.com/photo-1634507307799-ace9b49840b7?ixid=MnwyOTE3Mjh8MHwxfHNlYXJjaHwxfHwlMjdkZW52ZXIlMkNjbyUyN3xlbnwwfHx8fDE2NDI1NDI0Njg&ixlib=rb-1.2.1",
                "credit": {
                    "source": "unsplash.com",
                    "photographer": "Dillon Wanner",
                    "photographer_profile": "https://unsplash.com/@dillydallying"
                }
            }
        }
    }
}
```

Attributes within the response:
* `image`
  * `location` - returns the search parameter
  * `image_url` - link to the image
  * `credit` - contains required information for crediting the source and photographer

### 3. User Registration

The user's email, password, and password confirmation must be provided in the body of the JSON request (_not_ as a query parameter!). Email addresses must be unique (must not already exist in the database), and a user's chosen password must match their password confirmation.

```
POST /api/v1/users
Content-Type: application/json
Accept: application/json

{
  "email": "user@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```

Example Response:

Successful user creation will return an HTTP 201 status along with the following information.

```
{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "user@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
```

Note: unsuccessful user creation will result in an HTTP status code of 400 and a response like this:
```
{
  "errors": {
    "detail": "Email has already been taken"
  }
}
```

### 4. Login

Allows existing users to enter their email and password to log in. As with registration, the user's credentials must be sent in the body of the request, not as query parameters. Successful responses will return the user's email and api key as shown below.

```
POST /api/v1/sessions
Content-Type: application/json
Accept: application/json

{
  "email": "user@example.com",
  "password": "password"
}
```

Example Response:
```
{
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "user@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
```

### 5. Roadtrip

Returns road trip information for a given origin and destination, including estimated travel time and forecast in destination upon arrival. **Note: This endpoint requires authentication.** A valid api key must be sent in the body of the JSON request.

```
POST /api/v1/road_trip
Content-Type: application/json
Accept: application/json

{
  "origin": "Denver,CO",
  "destination": "Pueblo,CO",
  "api_key": "jgn983hy48thw9begh98h4539h4"
}
```

Example Response:
```
{
    "data": {
        "id": "null",
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver, CO",
            "end_city": "Estes Park, CO",
            "travel_time": "1 hour, 22 minutes",
            "weather_at_eta": {
                "temperature": 37.11,
                "conditions": "overcast clouds"
            }
        }
    }
}
```
