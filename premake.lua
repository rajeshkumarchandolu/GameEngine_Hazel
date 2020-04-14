workspace "GameEngine_Hazel"
configurations{
	debug,release
}

outputdir = "%{cfg.buildcfg}/%{cfg.system}/%{cfg.architecture}"

project "GameEngine_Hazel"
	location "%{workspace.name}/GameEngine_Hazel"
	kind "SharedLib"
	language "c++"
	targetdir("GameEngine_Hazel/bin/".. outputdir .. "%{prj.name}")
	objdir("GameEngine_Hazel/bin/intermediate/".. outputdir .. "%{prj.name")

	files{
		"%{workspace.name}/%{prj.name}/src/**.h",
		"%{workspace.name}/%{prj.name}/src/**.cpp",
	}

	include{
		"%{workspace.name}/%{prj.name}/Dependencies/spdlog/src"
	}
	filter "system:windows"
		cppdialect "c++17"
		staticruntime "on"
		systemversion "10.0.18362.0"
		defines{
			"HAZEL_BUILD_WINDOWS",
			"HZ_BUID_DLL" 
		}

		postbuildcommands{
			 "copy %{workspace.name}/bin/".. outputdir .. "%{prj.name} %{workspace.name}/bin/".. outputdir .. "Sandbox_Application" 
		}

	filter "configurations:Debug"
		defines "HZ_DEBUG"
		symbols "ON"

	filter "configurations:Release"
		defines "HZ_RELEASE"
		optimize "ON"
	

project "Sandbox_Application"
	location "%{workspace.name}/Sandbox_Application"
	kind "ConsoleApp"
	language "c++"
	targetdir("GameEngine_Hazel/bin/".. outputdir .. "%{prj.name}")
	objdir("GameEngine_Hazel/bin/intermediate/".. outputdir .. "%{prj.name")

	files{
		"%{workspace.name}/%{prj.name}/src/**.h",
		"%{workspace.name}/%{prj.name}/src/**.cpp",
	}

	include{
		"%{workspace.name}/GameEngine_Hazel/src"
	}
	links {
		"GameEngine_Hazel"
	}
	filter "system:windows"
		cppdialect "c++17"
		staticruntime "on"
		systemversion "10.0.18362.0"
		defines{
			"HAZEL_BUILD_WINDOWS",			 
		}

	filter "configurations:Debug"
		defines "HZ_DEBUG"
		symbols "ON"

	filter "configurations:Release"
		defines "HZ_RELEASE"
		optimize "ON"