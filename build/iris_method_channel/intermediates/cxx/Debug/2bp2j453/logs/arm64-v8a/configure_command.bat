@echo off
"C:\\Users\\amr alaa\\AppData\\Local\\Android\\sdk\\cmake\\3.22.1\\bin\\cmake.exe" ^
  "-HC:\\Users\\amr alaa\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\iris_method_channel-2.0.1\\src" ^
  "-DCMAKE_SYSTEM_NAME=Android" ^
  "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON" ^
  "-DCMAKE_SYSTEM_VERSION=16" ^
  "-DANDROID_PLATFORM=android-16" ^
  "-DANDROID_ABI=arm64-v8a" ^
  "-DCMAKE_ANDROID_ARCH_ABI=arm64-v8a" ^
  "-DANDROID_NDK=C:\\Users\\amr alaa\\AppData\\Local\\Android\\sdk\\ndk\\23.1.7779620" ^
  "-DCMAKE_ANDROID_NDK=C:\\Users\\amr alaa\\AppData\\Local\\Android\\sdk\\ndk\\23.1.7779620" ^
  "-DCMAKE_TOOLCHAIN_FILE=C:\\Users\\amr alaa\\AppData\\Local\\Android\\sdk\\ndk\\23.1.7779620\\build\\cmake\\android.toolchain.cmake" ^
  "-DCMAKE_MAKE_PROGRAM=C:\\Users\\amr alaa\\AppData\\Local\\Android\\sdk\\cmake\\3.22.1\\bin\\ninja.exe" ^
  "-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=D:\\Apps\\preno_doctorSide\\build\\iris_method_channel\\intermediates\\cxx\\Debug\\2bp2j453\\obj\\arm64-v8a" ^
  "-DCMAKE_RUNTIME_OUTPUT_DIRECTORY=D:\\Apps\\preno_doctorSide\\build\\iris_method_channel\\intermediates\\cxx\\Debug\\2bp2j453\\obj\\arm64-v8a" ^
  "-DCMAKE_BUILD_TYPE=Debug" ^
  "-BC:\\Users\\amr alaa\\AppData\\Local\\Pub\\Cache\\hosted\\pub.dev\\iris_method_channel-2.0.1\\android\\.cxx\\Debug\\2bp2j453\\arm64-v8a" ^
  -GNinja ^
  "-DANDROID_STL=c++_static"
