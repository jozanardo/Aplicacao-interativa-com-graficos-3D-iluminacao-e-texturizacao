# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /snap/cmake/1356/bin/cmake

# The command to remove a file.
RM = /snap/cmake/1356/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/build

# Include any dependencies generated for this target.
include examples/Atividade03/CMakeFiles/Atividade03.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include examples/Atividade03/CMakeFiles/Atividade03.dir/compiler_depend.make

# Include the progress variables for this target.
include examples/Atividade03/CMakeFiles/Atividade03.dir/progress.make

# Include the compile flags for this target's objects.
include examples/Atividade03/CMakeFiles/Atividade03.dir/flags.make

examples/Atividade03/CMakeFiles/Atividade03.dir/main.cpp.o: examples/Atividade03/CMakeFiles/Atividade03.dir/flags.make
examples/Atividade03/CMakeFiles/Atividade03.dir/main.cpp.o: examples/Atividade03/CMakeFiles/Atividade03.dir/includes_CXX.rsp
examples/Atividade03/CMakeFiles/Atividade03.dir/main.cpp.o: /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/examples/Atividade03/main.cpp
examples/Atividade03/CMakeFiles/Atividade03.dir/main.cpp.o: examples/Atividade03/CMakeFiles/Atividade03.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object examples/Atividade03/CMakeFiles/Atividade03.dir/main.cpp.o"
	cd /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/build/examples/Atividade03 && /usr/bin/ccache /home/zanardo/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT examples/Atividade03/CMakeFiles/Atividade03.dir/main.cpp.o -MF CMakeFiles/Atividade03.dir/main.cpp.o.d -o CMakeFiles/Atividade03.dir/main.cpp.o -c /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/examples/Atividade03/main.cpp

examples/Atividade03/CMakeFiles/Atividade03.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/Atividade03.dir/main.cpp.i"
	cd /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/build/examples/Atividade03 && /home/zanardo/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/examples/Atividade03/main.cpp > CMakeFiles/Atividade03.dir/main.cpp.i

examples/Atividade03/CMakeFiles/Atividade03.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/Atividade03.dir/main.cpp.s"
	cd /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/build/examples/Atividade03 && /home/zanardo/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/examples/Atividade03/main.cpp -o CMakeFiles/Atividade03.dir/main.cpp.s

examples/Atividade03/CMakeFiles/Atividade03.dir/model.cpp.o: examples/Atividade03/CMakeFiles/Atividade03.dir/flags.make
examples/Atividade03/CMakeFiles/Atividade03.dir/model.cpp.o: examples/Atividade03/CMakeFiles/Atividade03.dir/includes_CXX.rsp
examples/Atividade03/CMakeFiles/Atividade03.dir/model.cpp.o: /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/examples/Atividade03/model.cpp
examples/Atividade03/CMakeFiles/Atividade03.dir/model.cpp.o: examples/Atividade03/CMakeFiles/Atividade03.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object examples/Atividade03/CMakeFiles/Atividade03.dir/model.cpp.o"
	cd /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/build/examples/Atividade03 && /usr/bin/ccache /home/zanardo/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT examples/Atividade03/CMakeFiles/Atividade03.dir/model.cpp.o -MF CMakeFiles/Atividade03.dir/model.cpp.o.d -o CMakeFiles/Atividade03.dir/model.cpp.o -c /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/examples/Atividade03/model.cpp

examples/Atividade03/CMakeFiles/Atividade03.dir/model.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/Atividade03.dir/model.cpp.i"
	cd /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/build/examples/Atividade03 && /home/zanardo/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/examples/Atividade03/model.cpp > CMakeFiles/Atividade03.dir/model.cpp.i

examples/Atividade03/CMakeFiles/Atividade03.dir/model.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/Atividade03.dir/model.cpp.s"
	cd /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/build/examples/Atividade03 && /home/zanardo/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/examples/Atividade03/model.cpp -o CMakeFiles/Atividade03.dir/model.cpp.s

examples/Atividade03/CMakeFiles/Atividade03.dir/window.cpp.o: examples/Atividade03/CMakeFiles/Atividade03.dir/flags.make
examples/Atividade03/CMakeFiles/Atividade03.dir/window.cpp.o: examples/Atividade03/CMakeFiles/Atividade03.dir/includes_CXX.rsp
examples/Atividade03/CMakeFiles/Atividade03.dir/window.cpp.o: /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/examples/Atividade03/window.cpp
examples/Atividade03/CMakeFiles/Atividade03.dir/window.cpp.o: examples/Atividade03/CMakeFiles/Atividade03.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object examples/Atividade03/CMakeFiles/Atividade03.dir/window.cpp.o"
	cd /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/build/examples/Atividade03 && /usr/bin/ccache /home/zanardo/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT examples/Atividade03/CMakeFiles/Atividade03.dir/window.cpp.o -MF CMakeFiles/Atividade03.dir/window.cpp.o.d -o CMakeFiles/Atividade03.dir/window.cpp.o -c /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/examples/Atividade03/window.cpp

examples/Atividade03/CMakeFiles/Atividade03.dir/window.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/Atividade03.dir/window.cpp.i"
	cd /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/build/examples/Atividade03 && /home/zanardo/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/examples/Atividade03/window.cpp > CMakeFiles/Atividade03.dir/window.cpp.i

examples/Atividade03/CMakeFiles/Atividade03.dir/window.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/Atividade03.dir/window.cpp.s"
	cd /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/build/examples/Atividade03 && /home/zanardo/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/examples/Atividade03/window.cpp -o CMakeFiles/Atividade03.dir/window.cpp.s

examples/Atividade03/CMakeFiles/Atividade03.dir/trackball.cpp.o: examples/Atividade03/CMakeFiles/Atividade03.dir/flags.make
examples/Atividade03/CMakeFiles/Atividade03.dir/trackball.cpp.o: examples/Atividade03/CMakeFiles/Atividade03.dir/includes_CXX.rsp
examples/Atividade03/CMakeFiles/Atividade03.dir/trackball.cpp.o: /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/examples/Atividade03/trackball.cpp
examples/Atividade03/CMakeFiles/Atividade03.dir/trackball.cpp.o: examples/Atividade03/CMakeFiles/Atividade03.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object examples/Atividade03/CMakeFiles/Atividade03.dir/trackball.cpp.o"
	cd /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/build/examples/Atividade03 && /usr/bin/ccache /home/zanardo/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT examples/Atividade03/CMakeFiles/Atividade03.dir/trackball.cpp.o -MF CMakeFiles/Atividade03.dir/trackball.cpp.o.d -o CMakeFiles/Atividade03.dir/trackball.cpp.o -c /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/examples/Atividade03/trackball.cpp

examples/Atividade03/CMakeFiles/Atividade03.dir/trackball.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/Atividade03.dir/trackball.cpp.i"
	cd /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/build/examples/Atividade03 && /home/zanardo/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/examples/Atividade03/trackball.cpp > CMakeFiles/Atividade03.dir/trackball.cpp.i

examples/Atividade03/CMakeFiles/Atividade03.dir/trackball.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/Atividade03.dir/trackball.cpp.s"
	cd /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/build/examples/Atividade03 && /home/zanardo/emsdk/upstream/emscripten/em++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/examples/Atividade03/trackball.cpp -o CMakeFiles/Atividade03.dir/trackball.cpp.s

# Object files for target Atividade03
Atividade03_OBJECTS = \
"CMakeFiles/Atividade03.dir/main.cpp.o" \
"CMakeFiles/Atividade03.dir/model.cpp.o" \
"CMakeFiles/Atividade03.dir/window.cpp.o" \
"CMakeFiles/Atividade03.dir/trackball.cpp.o"

# External object files for target Atividade03
Atividade03_EXTERNAL_OBJECTS =

/home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/public/Atividade03.js: examples/Atividade03/CMakeFiles/Atividade03.dir/main.cpp.o
/home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/public/Atividade03.js: examples/Atividade03/CMakeFiles/Atividade03.dir/model.cpp.o
/home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/public/Atividade03.js: examples/Atividade03/CMakeFiles/Atividade03.dir/window.cpp.o
/home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/public/Atividade03.js: examples/Atividade03/CMakeFiles/Atividade03.dir/trackball.cpp.o
/home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/public/Atividade03.js: examples/Atividade03/CMakeFiles/Atividade03.dir/build.make
/home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/public/Atividade03.js: abcg/libabcg.a
/home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/public/Atividade03.js: abcg/external/fmt/libfmt.a
/home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/public/Atividade03.js: abcg/external/imgui/libimgui.a
/home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/public/Atividade03.js: examples/Atividade03/CMakeFiles/Atividade03.dir/linkLibs.rsp
/home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/public/Atividade03.js: examples/Atividade03/CMakeFiles/Atividade03.dir/objects1.rsp
/home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/public/Atividade03.js: examples/Atividade03/CMakeFiles/Atividade03.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/public/Atividade03.js"
	cd /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/build/examples/Atividade03 && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Atividade03.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/Atividade03/CMakeFiles/Atividade03.dir/build: /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/public/Atividade03.js
.PHONY : examples/Atividade03/CMakeFiles/Atividade03.dir/build

examples/Atividade03/CMakeFiles/Atividade03.dir/clean:
	cd /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/build/examples/Atividade03 && $(CMAKE_COMMAND) -P CMakeFiles/Atividade03.dir/cmake_clean.cmake
.PHONY : examples/Atividade03/CMakeFiles/Atividade03.dir/clean

examples/Atividade03/CMakeFiles/Atividade03.dir/depend:
	cd /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/examples/Atividade03 /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/build /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/build/examples/Atividade03 /home/zanardo/Aplicacao-interativa-com-graficos-3D-iluminacao-e-texturizacao/build/examples/Atividade03/CMakeFiles/Atividade03.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : examples/Atividade03/CMakeFiles/Atividade03.dir/depend
