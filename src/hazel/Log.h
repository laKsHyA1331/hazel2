#pragma once
#include <memory>
#include "Core.h"
#include "spdlog/spdlog.h"

namespace hazel {
	class HAZEL_API Log
	{
	public:
		
		static void Init();
		static  std::shared_ptr<spdlog::logger> s_CoreLogger;  
		static std::shared_ptr<spdlog::logger> s_ClientLogger;
	};
}

#define HZ_CORE_TRACE(...)::hazel::Log::s_CoreLogger->trace(__VA_ARGS__)
#define HZ_CORE_INFO(...)::hazel::Log::s_CoreLogger->info(__VA_ARGS__)
#define HZ_CORE_WARN(...)::hazel::Log::s_CoreLogger->warn(__VA_ARGS__)
#define HZ_CORE_ERROR(...)::hazel::Log::s_CoreLogger->error(__VA_ARGS__)
#define HZ_CORE_FATAL(...)::hazel::Log::s_CoreLogger->fatal(__VA_ARGS__)




#define HZ_TRACE(...)::hazel::Log::s_ClientLogger->trace(__VA_ARGS__)
#define HZ_INFO(...)::hazel::Log::s_ClientLogger->info(__VA_ARGS__)
#define HZ_WARN(...)::hazel::Log::s_ClientLogger->warn(__VA_ARGS__)
#define HZ_ERROR(...)::hazel::Log::s_ClientLogger->error(__VA_ARGS__)
#define HZ_FATAL(...)::hazel::Log::s_ClientLogger->fatal(__VA_ARGS__)
