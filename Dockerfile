FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD target/SpringBootRest-0.0.6-SNAPSHOT.jar app.jar
ENV JAVA_OPTS=""
ENTRYPOINT exec java $JAVA_OPTS  -Dserver.port=8585 -jar /app.jar
