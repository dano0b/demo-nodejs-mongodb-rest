FROM node:10.16 as build
COPY . /app
WORKDIR /app
RUN yarn install

FROM node:10.16-alpine
RUN mkdir -p /app
COPY --from=build /app /app
ENV PORT=3000
ENV MONGODB_ADDON_URI=mongodb://<database_server>:27017/test
EXPOSE 3000
WORKDIR /app
ENTRYPOINT ["/app/bin/www"]
