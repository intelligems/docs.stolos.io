FROM jekyll/jekyll as builder

WORKDIR /usr/src/app/
COPY ./ /usr/src/app/
RUN bundle install &&\
    jekyll build

FROM nginx:1.13-alpine
COPY --from=builder /usr/src/app/_site /usr/share/nginx/html
