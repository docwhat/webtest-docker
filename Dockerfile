FROM ruby:2.2

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock /app/
RUN bundle install --retry=3 --jobs=3

COPY ./ /app/

EXPOSE 8080

CMD ["ruby", "webtest.rb", "-p", "8080", "-o", "0.0.0.0"]
