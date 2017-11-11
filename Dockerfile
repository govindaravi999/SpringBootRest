FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD target/SpringBootRest-${env.MAJOR_VERSION}.${env.BUILD_NUMBER}.jar app.jar
ENV JAVA_OPTS=""
ENTRYPOINT exec java $JAVA_OPTS  -Dserver.port=8585 -jar /app.jar
