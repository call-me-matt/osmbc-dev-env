FROM node:12

# clone osmbc
RUN git clone https://github.com/TheFive/osmbc.git /var/www/osmbc

WORKDIR /var/www/osmbc

# install osmbc and dependencies
#RUN npm install istanbul -g  # used for Codecoverage during npm test
RUN npm install nyc -g
RUN npm install mocha -g  # used for tests during npm test
RUN npm install
#RUN npm install bower -g
#RUN bower install 

# cleanup
RUN apt-get clean && apt-get --yes --quiet autoremove --purge \
    && rm -Rf /tmp/*

RUN touch init-db.flag

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
