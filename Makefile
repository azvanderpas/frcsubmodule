.PHONY: clean all

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

clean:
	rm -rf ../src/main/java/com/revrobotics
	rm -rf ../src/main/java/frc/robot/common
	rm -rf ../src/test/java/common


