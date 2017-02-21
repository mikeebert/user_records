$LOAD_PATH << File.expand_path(File.dirname(__FILE__)) + '/lib'

require './user_records_api'
require 'datastore'
Datastore.set_location('./records.txt')

run UserRecords::API
