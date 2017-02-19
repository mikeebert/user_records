$: << File.expand_path(File.dirname(__FILE__)) + '/lib'

require './records_api'
require 'datastore'
Datastore.set_location('./records.txt')

run Records::API
