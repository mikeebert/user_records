def clear_datastore
  File.new('./spec/support/record_datastore.txt', 'w+').close
  Datastore.reset!
end
