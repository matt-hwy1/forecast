# README

## Bootstrapping the project

- This project uses ruby 3.1.2 and rails 7.1.3 without any database.
- It calls out to an external weather API from [Visual Crossing](https://www.visualcrossing.com/)
- To install, run the following commands at a Unix command line:

`git clone git@github.com:matt-hwy1/forecast.git`\
`cd forecast`\
`bundle install`\
`bin/rails dev:cache`\
`bin/rails server`

The app will be available at [http://localhost:3000](http://localhost:3000)

## Testing

Run the test suite with `bundle exec rspec`

## Project implementation

Relevant requirements (completed):

  - [x] Must be done in Ruby on Rails

  - [x] Accept an address as input

  - [x] Retrieve forecast data for the given address. This should include, at minimum, the current temperature

  - [x] Bonus points - Retrieve high/low and/or extended forecast

  - [x] Display the requested forecast details to the user

  - [x] Cache the forecast details for 30 minutes for all subsequent requests by zip codes. Display indicator if result is pulled from cache.
    - For this latter item, I saw a bit of a contradiction in the requirements. The requirements state to be able to search by address, whereas this caching requirement states to cache by zip code. Normally, I'd engage the project stakeholders to clarify the requireents. Since that wasn't an option here, I instead opted to cache by the input address, since zip code is not a guaranteed input, searches may be international, and a free-form address is the input of most searches.

## Design discussion

* Given the time constraints, this project was kept simple. It implements server-side rendering, rather than using AJAX and Javascript to create a single page application.
* I normally would have implemented the controller logic as a back end API for a a remote client or single page application. However, given the requirements, this appeared to require a monolithic Rails design, which I implemented here. It would be very easy to transfer this to an API-driven design for other kinds of clients.
* Similarly, due to time constraints, additional routes, gems, and superfluous files generated from the Rails framework, which were not necessary for this project weren't culled from the project. In a production project, some of these would be needed later, however.
* Styling for this project was kept simple and minimal.
* The app calls out to a weather API from Visual Crossing, which can be tested [here](https://www.visualcrossing.com/weather/weather-data-services#)
* The API returns a large data set, only a small part of which is being used here.
* The design implements dependency injection of the API client into the main API, whereby a switch to a different API should require only a small amount of code changes. Base classes are used as interfaces to enforce different implementations to provide the same external API to their consumers.
* Similarly, for a more scalable approach, I would have implemented the above as an API that returns JSON to the client.

## Object Decomposition

* This project is driven by a service object called the ForecastService. This object instantiates a Forecast object, which uses and API client implementation to look up the forecast via a remote API. This API for which includes a current weather section as well as forecast information.
* The ForecastService instantiates a specific implementation of the Forecast interface.
* The Forecast interface takes a specific implementation of an API client, passed to it via dependency injection.
* In this project, the API implementation is the VisualCrossing API client.
* If a different API implementation is desired, lookup functionality provides a way to easily instantiate other implementations of the Forecast interface. Other API clients would be simple to add. This can be useful for failover and redundancy.



