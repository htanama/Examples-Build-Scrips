# Examples-Build-Scrips
These are example of build scripts to compile in Linux and Windows using Microsoft Visual C++ and GCC/G++ compiler

To run the Makefile, please remove the unnecessary description. The make needs to read "Makefile" file
To run the CMakeLists.txt, please remove teh unnecessary description. The CMake needs to read "CMakeLists.txt" 

How to Compile simple GLFW (OpenGL API) application: 
```bash                                                                                                 
g++ main.cpp -o test -L/usr/lib/x86_64-linux-gnu -lglfw -lGL -lX11 -lpthread
```
