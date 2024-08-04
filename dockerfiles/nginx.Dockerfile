FROM nginx:alpine

COPY . /usr/share/nginx/html

LABEL maintainer="ваш_email@example.com"
RUN docker tag nginx:latest public.ecr.aws/o5n0v8g1/nginx:latest

CMD ["nginx", "-g", "daemon off;"]
