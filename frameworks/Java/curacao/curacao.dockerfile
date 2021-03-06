FROM maven:3.5.3-jdk-9-slim as maven
WORKDIR /curacao
COPY pom.xml pom.xml
COPY src src
RUN mvn compile war:war -q

FROM techempower/resin:0.1
COPY --from=maven /curacao/target/curacao.war ${RESIN_HOME}/webapps/ROOT.war
CMD java -jar ${RESIN_HOME}/lib/resin.jar console
