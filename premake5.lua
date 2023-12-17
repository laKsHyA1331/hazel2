workspace "hazel"
	architecture "x64"

	configurations {
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
project "hazel"
	location "hazel"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
	}
	includedirs {
		"%{prj.name}/vendor/spdlog/include"
	}
	filter "system:windows"
		cppdialect "c++17"
		staticruntime "ON"
		systemversion "10.0"
	defines {
		"HZ_PLATFORM_WINDOWS" ,
		"HZ_BUILD_DLL" 
	}
	
	postbuildcommands{
		("{COPY}%{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
	}

	filter "configurations:Debug"
		defines "HZ_DBUG"
		symbols "ON"

	filter "configurations:Release"
		defines "HZ_RELEASE"
		optimize "ON"

	filter "configurations:Dist"
		defines "HZ_DIST"
		optimize "ON"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
	}
	includedirs {
		"hazel/vendor/spdlog/include",
		"hazel/src"
	}
	links{
		"hazel"
	}
	filter "system:windows"
		cppdialect "c++17"
		staticruntime "ON"
		systemversion "10.0"
	defines {
		"HZ_PLATFORM_WINDOWS" ,
		"HZ_BUILD_DLL" 
	}
	
	postbuildcommands{
		("{COPY}%{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
	}

	filter "configurations:Debug"
		defines "HZ_DBUG"
		symbols "ON"

	filter "configurations:Release"
		defines "HZ_RELEASE"
		optimize "ON"

	filter "configurations:Dist"
		defines "HZ_DIST"
		optimize "ON"