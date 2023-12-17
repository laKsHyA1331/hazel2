#pragma once
#include "Application.h"
#include"Log.h"
#ifdef HZ_PLATFORM_WINDOWS	
extern hazel::Application* hazel::createApplication(); 

int main(int argc, char** argv) {

	hazel::Log::Init();
	HZ_CORE_WARN("initialised"); 
	HZ_INFO("Hello!");
	auto app = hazel::createApplication(); 
	app->Run();
	delete app;
}

#endif