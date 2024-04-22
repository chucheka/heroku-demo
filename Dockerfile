FROM openjdk:17-jdk-alphine
WORKDIR /app
COPY /var/lib/jenkins/workspace/heroku-demo/target/heroku-demo-0.0.1-SNAPSHOT.jar /app/heroku-demo.jar
EXPOSE 8080
CMD ["java", "-jar", "heroku-demo.jar"]
