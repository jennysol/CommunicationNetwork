#!/bin/bash

rm -f tmp/pids/*.pid


# Create pid folder
# mkdir tmp
# mkdir tmp/pids

# Migrating database
bin/rails db:migrate

# Start the rails server
bin/rails s -p ${PORT} -b 0.0.0.0
