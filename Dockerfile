FROM openjdk:17 as build

WORKDIR /app

COPY . /app

RUN javac HelloWorld.java && jar cmvf META-INF/MANIFEST.MF HelloWorld.jar *.class

EXPOSE 8000

CMD ["java", "-Dhelloworld.port=8000", "-jar", "HelloWorld.jar"]