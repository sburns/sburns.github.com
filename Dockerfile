FROM jekyll/jekyll:minimal
WORKDIR /site
COPY . /site
RUN jekyll build

FROM nginx
COPY --from=0 /site/_site /usr/share/nginx/html
