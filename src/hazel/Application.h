#pragma once
#include "Core.h"
namespace hazel {

	class HAZEL_API Application

	{
	public:
		void Run();
	};
	Application* createApplication(); //to be defined in client 
}
