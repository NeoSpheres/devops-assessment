# Start from Alpine image with node JS version 18
FROM node:lts-alpine3.16 as deps
WORKDIR /app

# Install dependencies
COPY package.json ./

FROM node:lts-alpine3.16 AS builder
WORKDIR /app

COPY . .
COPY --from=deps /app/node_modules ./node_modules

EXPOSE 4001

CMD ["node", "server.js"]
