#!/bin/sh

if [ ! -f db-ready.flag ]; then
   echo "First start, creating database."
   node ./import/createdb.js --createTables --dropTables --createView --createIndex --verbose --addUser $OSMUSERNAME && touch db-ready.flag
   echo "add local login with password 'test'"
   echo "$OSMUSERNAME:\$2y\$05\$WbBcRVSTP5nOPhcQs6HTguemtIJrkKAUvElBZ7Kkme5R7rBn6e92a" > /var/www/osmbc/test_pwd
fi

# startup
npm start
