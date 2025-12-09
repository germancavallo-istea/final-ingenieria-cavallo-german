# ---- Stage 1: Build the Quasar app ----
FROM node:18-alpine AS build

WORKDIR /app
COPY package*.json ./
RUN npm install

COPY . .
RUN npx quasar build

# ---- Stage 2: Serve with nginx ----
FROM nginx:1.25-alpine

# Copy built files to nginx html directory
COPY --from=build /app/dist/spa /usr/share/nginx/html

# Expose port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
