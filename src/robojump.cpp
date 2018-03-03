#include <iostream>

enum STATUS {
	SUCCESS,
	FAILURE
};

class RoboMap {
	private:
		
	public:
		void hi();
};

class EntityRobot {
	private:
		float x;
		float y;
	public:
		int setPosition(float, float, RoboMap);
};

int EntityRobot::setPosition(float x, float y, RoboMap destination) {
	this->x = x;
	this->y = y;
	return SUCCESS;
}

int main() {
	//game code here
	EntityRobot mainPlayer;
	RoboMap rmainMap;
	mainPlayer.setPosition(0.0f, 0.0f, rmainMap);
	return 0;
}
