FROM openjdk:17-jdk-alpine
WORKDIR /app
COPY target/heroku-demo-0.0.1-SNAPSHOT.jar /app/heroku-demo.jar
EXPOSE 8080
CMD ["java", "-jar", "heroku-demo.jar"]
