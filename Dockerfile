FROM node:16-alpine AS builder

WORKDIR /usr/src/app
COPY package.json .
RUN npm ci

RUN npm run build
RUN useradd -m -u 1000 app

FROM node:16-alpine

WORKDIR /usr/src/opt
COPY --from=builder /usr/src/app/build .

# expose port
USER app
EXPOSE 3000
CMD ["npm", "start"]
