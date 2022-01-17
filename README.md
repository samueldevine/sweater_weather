# README

### Description

Sweather Weather is a Rails backend API (initialized with the `--api` flag) that provides several endpoints for a hypothetical frontend to consume. It is compliant with the [JSON API spec](https://jsonapi.org/) and could be used to develop a frontend application which provides users with realtime weather data as well as the ability to plan a roadtrip and see forecasted weather in their destination at their estimated time of arrival. To provide this information, the backend application consumes data from the following external APIs:
* [Mapquest Geocoding API](https://developer.mapquest.com/documentation/geocoding-api/)
* [Mapquest Directions API](https://developer.mapquest.com/documentation/directions-api/)
* [OpenWeather Onecall API](https://openweathermap.org/api/one-call-api)
* [Unsplash API](https://unsplash.com/documentation)

### Usage

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

### Authentication and Authorization

Sweater Weather provides one API Key per user upon registration. This key is required to log in and to use the Roadtrip endpoint. The Weather endpoints are public and free to use without a key. 
