![Build image](https://travis-ci.org/mikeebert/user_records.svg?branch=master)

# Grape API Example

This example app uses the [Grape framework for Ruby](https://github.com/ruby-grape/grape). It has a `/records` endpoint that takes in raw text for creating a `UserRecord` and then saves the records to the `records.txt` file. Records can be retrieved via the `records/name` or `records/birthdate` endpoints.

## Setup
* The app was built using `ruby 2.3.1p112`
* Clone the repo
* Install the gem dependencies using `bundle install`
* Run the tests from the command line using `rspec spec/`
* Start the server from the command line using `rackup`

## Posting a record

Records should be posted using the following format, and the `Content-Type: application/txt` header:  
`FirstName, LastName, FavoriteColor, DateOfBirth(as dd/mm/yyyy)`.

Values may be delimited using a comma or a pipe. Example posts:  
`curl -X POST -H 'Content-Type: application/txt' localhost:9292/records -d 'Clay, Cassius, Yellow, 17/1/1942'`  
`curl -X POST -H 'Content-Type: application/txt' localhost:9292/records -d 'Balboa | Rocky | Red | 6/1/1945'`  
(The app has also been tested with clients such as [Postman](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop?utm_source=chrome-app-launcher-info-dialog) and [ARC](https://chrome.google.com/webstore/detail/advanced-rest-client/hgmloofddffdnphfgcellkdfbfbjeloo?utm_source=chrome-app-launcher-info-dialog)).

## Retrieving Records

With a server running, records can be retrieved sorted by birthdate at `http://localhost:9292/records/birthdate`.  
They can also be retrieved sorted by last name in descending order at `http://localhost:9292/records/name` endpoint.

## Next steps (if the business requirements called for it):
* Add validity checks for each field to the `RecordCreator` class.
* If an instance of `RecordCreator.valid?` returns `false`, then I'd recommend adding an `errors` method to the `RecordCreator` that returns a hash of helpful error messages for each field that was invalid.
