FROM maven:openjdk

RUN mkdir -p /root/reprova/

WORKDIR /root/reprova/

COPY src src
COPY pom.xml .

RUN mvn clean package && \
	mv target/reprova-0.1.jar reprova.jar

expose 8080

cmd java -jar reprova.jar