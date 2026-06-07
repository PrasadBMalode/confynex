FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY confynex/ .
RUN mvn clean package -DskipTests

FROM tomcat:9.0-jdk11
COPY --from=build /app/target/confynex.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]