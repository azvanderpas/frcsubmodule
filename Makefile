VENDOR_DEP_URLS= \
https://maven.ctr-electronics.com/release/com/ctre/phoenix6/latest/Phoenix6-frc2024-latest.json \
https://maven.ctr-electronics.com/release/com/ctre/phoenix/Phoenix5-frc2024-latest.json \
https://software-metadata.revrobotics.com/REVLib-2024.json \
https://github.com/Mechanical-Advantage/AdvantageKit/releases/latest/download/AdvantageKit.json \
https://maven.photonvision.org/repository/internal/org/photonvision/photonlib-json/1.0/photonlib-json-1.0.json \
https://www.playingwithfusion.com/frc/playingwithfusion2024.json \
https://3015rangerrobotics.github.io/pathplannerlib/PathplannerLib.json

LINK_LOCS= \
../src/main/java/frc/robot/common \ 
../src/test/java/common \
../src/main/java/com/revrobotics 

SUBMOD_LOCS= \
common \
test \
com/revrobotics



.PHONY: clean all init vendordeps

all: $(LINK_LOCS)

../src/test/java/common:
	mkdir -p ../src/test/java/common
	ln -P test/* ../src/test/java/common

../src/main/java/frc/robot/common:
	mkdir -p ../src/main/java/frc/robot/common
	ln -P main/* ../src/main/java/frc/robot/common

../src/main/java/com/revrobotics:
	mkdir -p ../src/main/java/com/revrobotics
	ln -P com/revrobotics/* ../src/main/java/com/revrobotics

# build.gradle and .gitignore may quickly deviate based on the 
# year, so treating more as a template to start with rather than linking
init: vendordeps
	cp -f build.gradle ../build.gradle
	cp -f _gitignore ../.gitignore

vendordeps: 
	for u in $(VENDOR_DEP_URLS); \
	do \
		pushd .. &&  ../gradlew vendordep --url=$$u; \
		mv vendordeps/$$(basename $$u) vendordeps/$$(head vendordeps/$$(basename $$u) | grep -m1 .json | awk -F'"' '{print $$4}'); \
		popd; \
	done


clean:
	rm -rf ../src/main/java/com/revrobotics
	rm -rf ../src/main/java/frc/robot/common
	rm -rf ../src/test/java/common


