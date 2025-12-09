# Usamos Nginx ligero
FROM nginx:alpine

# Limpiamos el contenido por defecto
RUN rm -rf /usr/share/nginx/html/*

# Copiamos la build de Quasar
COPY dist/spa /usr/share/nginx/html

# Configuración opcional para rutas SPA
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Exponemos el puerto
EXPOSE 80

# Arrancamos Nginx
CMD ["nginx", "-g", "daemon off;"]
