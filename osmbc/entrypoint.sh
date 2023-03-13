#!/bin/sh

if [ ! -f db-ready.flag ]; then
   echo "First start, creating database."
   node ./import/createdb.js --createTables --dropTables --createView --createIndex --addUser $OSMUSERNAME --verbose # && touch db-ready.flag
   # workaround: import database from dump as above not working :-/
   #apt update
   #apt -y install postgresql-client
   #psql --host db postgres -U postgres < osmbc_data.pgdump
   touch db-ready.flag
fi

# startup
npm start
