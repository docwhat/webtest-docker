FROM ruby:2.1-onbuild

EXPOSE 8080

CMD ["ruby", "-vw", "webtest.rb", "-p", "8080", "-o", "0.0.0.0"]
