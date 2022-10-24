FROM maven as build
WORKDIR /workspace
COPY . .
RUN mvn install
FROM openjdk:8
COPY --from=build /workspace/target/my-maven-docker-project.jar ./
ENTRYPOINT ["java", "-jar","my-maven-docker-project.jar"]
EXPOSE 8080
