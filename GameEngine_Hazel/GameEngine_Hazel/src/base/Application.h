#pragma once

#include "Core.h"

namespace hazel {
	class HZ_API Application
	{
	public:
		Application();
		virtual ~Application();
		void run();

	private:
		bool isRunning = true;
	};

	//TO be defined in Client
	Application* startApplication();
}

