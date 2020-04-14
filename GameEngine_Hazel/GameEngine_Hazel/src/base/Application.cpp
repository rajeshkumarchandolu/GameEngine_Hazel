#include "Application.h"
#include<iostream>
namespace hazel {
	Application::Application()
	{
	}

	Application::~Application()
	{
	}

	void Application::run()
	{
		while (isRunning)
		{
			char ch = 'Y';
			std::cout << "Enter u r input !!" << std::endl;
			std::cin >> ch;
			if (ch == 'n') {
				isRunning = false;
				std::cout << "exit input selected" << std::endl;
			}
		}
	}
}