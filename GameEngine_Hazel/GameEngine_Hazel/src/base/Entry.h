#pragma once

#include"Application.h"

#ifdef HAZEL_BUILD_WINDOWS

extern hazel::Application* hazel::startApplication();

int main(int argc, char** argv) {
	hazel::Application* app = hazel::startApplication();
	app->run();
	delete app;
}
#endif // HZ_BUID_DLL