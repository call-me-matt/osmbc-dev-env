#!/bin/bash
if [[ $OSMUSERNAME == "yourOsmUsername" ]]; then
   echo "Please set your OSM user name in docker-compose.yml"
   exit
fi

if [ ! -f installed.flag ]; then
   echo "First start, installing OSMBC and dependencies."
   # install osmbc and dependencies
   git clone https://github.com/TheFive/osmbc.git /tmp/osmbc
   cp -a /tmp/osmbc/. .
   npm install nyc -g
   npm install mocha -g
   npm install
   # cleanup
   apt-get clean && apt-get --yes --quiet autoremove --purge && rm -Rf /tmp/*
   # init database
   echo "initializing database..."
   node ./import/createdb.js --createTables --dropTables --createView --createIndex --verbose --addUser $OSMUSERNAME
   echo "add local login with password 'test'"
   echo "$OSMUSERNAME:\$2y\$05\$WbBcRVSTP5nOPhcQs6HTguemtIJrkKAUvElBZ7Kkme5R7rBn6e92a" > /var/www/osmbc/test_pwd
   # flag as installed
   touch installed.flag
fi

# startup
npm start
