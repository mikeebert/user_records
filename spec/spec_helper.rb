require 'fileutils'

def clear_datastore
  f = File.new('./spec/support/record_datastore.txt', 'w+')
  f.close
  Datastore.reset!
end
