FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

RUN apk update && apk add --no-cache curl

COPY ./target/ /app/

# Expose the default Quarkus port
EXPOSE 8080

ENV ROOKOUT_TOKEN a7a67eca61d2a8505d4a4aa860060701d3e3ff0a212fd3ed2b97e7ba4e930ed0
ENV ROOKOUT_LABELS "env:dev"

RUN curl -L "https://get.rookout.com/rook.jar" -o /app/rook.jar
ENV JAVA_TOOL_OPTIONS "-javaagent:/app/rook.jar"

# Run the application
CMD ["java", "-jar", "/app/rookout-demo-1.0.0-SNAPSHOT-runner.jar"]
#CMD ["/bin/sh"]