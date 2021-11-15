#!/bin/sh

if [ -f init-db.flag ]; then
   echo "First start, creating database."
   node ./import/createdb.js --createTables --dropTables --createView --createIndex --addUser $OSMUSERNAME --verbose && rm init-db.flag
fi

# startup
npm start
