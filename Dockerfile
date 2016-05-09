FROM convox/rails

# copy only the files needed for bundle install
COPY Gemfile      /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

# copy only the files needed for assets:precompile
COPY Rakefile   /app/Rakefile
COPY config     /app/config
COPY public     /app/public
COPY app/assets /app/app/assets
RUN rake assets:precompile

# copy the rest of the app
COPY . /app
