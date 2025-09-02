# Image web ultra-légère
FROM nginx:alpine
# On copie notre site dans le dossier servi par Nginx
COPY site /usr/share/nginx/html
