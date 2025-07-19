# Examples-Build-Scrips
These are example of build scripts to compile in Linux and Windows using Microsoft Visual C++ and GCC/G++ compiler

To run the Makefile, please remove the unnecessary description. The make needs to read "Makefile" file
To run the CMakeLists.txt, please remove teh unnecessary description. The CMake needs to read "CMakeLists.txt" 

How to compile simple GLFW (OpenGL API) application on Linux based OS: 
```bash                                                                                                 
g++ main.cpp -o test -L/usr/lib/x86_64-linux-gnu -lglfw -lGL -lX11 -lpthread
```

Find the location of your MSVC vcvars64.bat (64-bit Microsoft Windows OS)
`C:\Program Files (x86)\Microsoft Visual Studio\<YEAR>\<EDITION>\VC\Tools\MSVC\<VERSION>\bin\HostX64\x64\vcvars64.bat`<br>
How to compile simple GLFW (OpenGL API) application on Windows:
```DOS
cl /EHsc /Zi /I"C:\Libs\glfw-3.4.bin.WIN64\include" main.cpp /link /LIBPATH:"C:\Libs\glfw-3.4.bin.WIN64\lib-vc2022" glfw3dll.lib opengl32.lib gdi32.lib shell32.lib user32.lib /OUT:myprogram.exe
```
