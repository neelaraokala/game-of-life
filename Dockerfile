FROM maven:3-openjdk-8 as builder
LABEL author='Neelaraokala'
RUN git clone https://github.com/neelaraokala/game-of-life.git && cd game-of-life && mvn package

FROM tomcat:8
LABEL author='Neelaraokala'
COPY --from=builder /game-of-life/gameoflife-web/target/gameoflife.war /usr/local/tomcat/webapps/gameoflife.war
CMD ["catalina.sh", "run"]
