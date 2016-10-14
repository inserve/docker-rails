FROM inserve/rails:4

COPY ./Gemfile* ./
RUN bundle install --without=development,test

COPY . ./

RUN rm config/database.yml && \
    DATABASE_URL=sqlite3:///tmp/dummy.sqlite3 bundle exec rake assets:precompile