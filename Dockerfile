# our base build image
FROM maven:3.5-jdk-8 as maven

# copy the project files
COPY ./pom.xml ./pom.xml

# # build all dependencies
# RUN mvn dependency:go-offline -B

# copy your other files
COPY ./src ./src

# build for release
RUN mvn package

# our final base image
# FROM openjdk:8u171-jre-alpine

# # set deployment directory
# WORKDIR /app

# # copy over the built artifact from the maven image
# COPY --from=maven ./target/*.jar ./

# set the startup command to run your binary
CMD ["java", "-jar", "./target/spring-boot-web-jsp-1.0.war"]



