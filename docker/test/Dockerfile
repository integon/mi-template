FROM node:16-alpine
USER node
ENV NODE_ENV=production
WORKDIR /app
RUN npm install httpyac@5.8.2 chai@4.3.7
ENTRYPOINT [ "npx", "httpyac" ]
