
#ifdef  HAZEL_BUILD_WINDOWS
	#ifdef  HZ_BUID_DLL
		#define HZ_API _declspec(dllexport)
	#else
		#define HZ_API _declspec(dllimport)
	#endif //  HZ_DLL
#else
	#error Only Windows OS is supported!

#endif //  HAZEL_BUILD_WINDOWS

