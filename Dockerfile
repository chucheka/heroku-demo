FROM open jdk:17
WORKDIR /heroku-app
COPY heroku-demo /heroku-app
EXPOSE 8080
CMD ["java", "-jar", "heroku-demo-0.0.1-SNAPSHOT.jar"]
