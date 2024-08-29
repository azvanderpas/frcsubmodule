.PHONY: clean all init vendordeps

all: ../src/main/java/frc/robot/common ../src/main/java/com/revrobotics ../src/test/java/common 

../src/test/java/common:
	mkdir -p ../src/test/java/common
	ln -P test/* ../src/test/java/common

../src/main/java/frc/robot/common:
	mkdir -p ../src/main/java/frc/robot/common
	ln -P main/* ../src/main/java/frc/robot/common

../src/main/java/com/revrobotics:
	mkdir -p ../src/main/java/com/revrobotics
	ln -P com/revrobotics/* ../src/main/java/com/revrobotics

init: vendordeps
	cp -f build.gradle ../build.gradle
	cp -f _gitignore ../.gitignore

vendordeps: 
	cd .. && ./gradlew vendordep --url=https://maven.ctr-electronics.com/release/com/ctre/phoenix6/latest/Phoenix6-frc2024-latest.json 
	cd .. && ./gradlew vendordep --url=https://maven.ctr-electronics.com/release/com/ctre/phoenix/Phoenix5-frc2024-latest.json
	cd .. && ./gradlew vendordep --url=https://software-metadata.revrobotics.com/REVLib-2024.json
	cd .. && ./gradlew vendordep --url=https://github.com/Mechanical-Advantage/AdvantageKit/releases/latest/download/AdvantageKit.json
	cd .. && ./gradlew vendordep --url=https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-json/1.0/photonlib-json-1.0.json
	cd .. && ./gradlew vendordep --url=https://www.playingwithfusion.com/frc/playingwithfusion2024.json


clean:
	rm -rf ../src/main/java/com/revrobotics
	rm -rf ../src/main/java/frc/robot/common
	rm -rf ../src/test/java/common


