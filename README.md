# Grape API Example

The following app uses the [Grape framework for Ruby](https://github.com/ruby-grape/grape) and has a `/resources` endpoint that takes in raw text for creating a `UserRecord` and then saves the records to the `records.txt` file.

Records should be posted using the following format, and the `Content-Type: application/txt` header:
`FirstName, LastName, FavoriteColor, DateOfBirth`. Values may be
delimited using a comma or a pipe. Example posts:
`curl -X POST -H "Content-Type: application/txt" localhost:9292/records
-d "Clay, Cassius, Yellow, 1/17/1942"`
`Balboa, Rocky, Red, 1/6/1945


Next Steps (if the business requirements existed):
* Add validity checks for each field to the `RecordCreator` class.
* If a `RecordCreator` validity check fails, then add an `errors` method
  that would return a hash of error messages for each field that was
invalid. 
