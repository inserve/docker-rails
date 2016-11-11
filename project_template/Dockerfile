FROM inserve/rails:4

COPY ./Gemfile* ./
RUN bundle install --without=development,test

COPY . ./

RUN (([ -f "config/database.yml" ] && rm config/database.yml) || true ) && \
    (([ -f "Rakefile" ] && DATABASE_URL=sqlite3:///tmp/dummy.sqlite3 bundle exec rake assets:precompile) || true)