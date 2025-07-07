::C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.36.32532\bin\Hostx64\x64
::C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.36.32532\bin\Hostx86\x86
::example build script in windows using MSVC cl.exe
@echo off

cl -Zi /Fe: LoadFromFile32.exe LoadFromFile.cpp /I"C:\dev\SDL2\include" /link /LIBPATH:C:\dev\SDL2\lib\x86 /SUBSYSTEM:WINDOWS shell32.lib SDL2.lib SDL2main.lib SDL2_image.lib


cl -Zi /Fe: viewport.exe 09_the_viewport.cpp /I"C:\dev\SDL2" /link /LIBPATH:C:\dev\SDL2\lib\x86 /SUBSYSTEM:WINDOWS shell32.lib SDL2.lib SDL2main.lib SDL2_image.lib

#Debug using MSVC 
devenv viewport.exe

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
REM THIS IS A WORKING SCRIPT:
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo off

REM Set the path to the Visual Studio environment variables
REM call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
REM call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars32.bat"

REM Set source files, object files, and output executable name

set SDL2_PATH=C:\dev\SDL2
set GLM_PATH=C:\dev
set IMGUI_PATH=..\imgui
set IMGUI_BACKEND_PATH=C:\imgui-master\backends

set SOURCE_FILES=..\src\*.cpp ..\imgui\*.cpp ..\imgui\backends\imgui_impl_sdl2.cpp ..\imgui\backends\imgui_impl_sdlrenderer2.cpp
set OUTPUT_EXE=my_program.exe

REM Set additional compiler and linker options if needed
set COMPILER_OPTIONS=/EHsc /Zi
set LINKER_OPTIONS=/SUBSYSTEM:WINDOWS Shell32.lib

REM Set library paths and libraries
set LIB_PATHS=C:\dev\SDL2\lib\x86
set LIBRARIES=SDL2main.lib SDL2_ttf.lib SDL2.lib SDL2_image.lib SDL2_mixer.lib

REM Compile source files

call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars32.bat"

cl %COMPILER_OPTIONS% %SOURCE_FILES% /Fe%OUTPUT_EXE% /I %SDL2_PATH% /I %GLM_PATH% /I %IMGUI_PATH% /I %IMGUI_BACKEND_PATH% /link /LIBPATH:%LIB_PATHS% %LIBRARIES% %LINKER_OPTIONS%

REM Clean up unnecessary files
del *.ilk *.obj *.pdb

REM Display any error messages
if errorlevel 1 (
    echo Compilation failed.
) else (
    echo Compilation successful.
)

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

set INC_VS=C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\Include
set INC_SDK_SH=C:\Program Files (x86)\Windows Kits\8.1\Include\shared
set INC_SDK_UM=C:\Program Files (x86)\Windows Kits\8.1\Include\um
cl.exe /c /W4 /nologo /EHsc /I %INC_VS% /I %INC_SDK_SH% /I %INC_SDK_UM% prog.c

prog.exe: prog.c
	"$(PF_32)\cl.exe" /c /W4 /nologo /EHsc /I $(INC_VS) /I $(INC_SDK_SH) /I $(INC_SDK_UM) prog.c
	"$(PF_32)\link.exe" /SUBSYSTEM:CONSOLE /LIBPATH:$(LIB_VS) /LIBPATH:$(LIB_SDK) prog.obj

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
REM THIS IS A WORKING SCRIPT:
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo off

REM Set the path to the Visual Studio environment variables
REM call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
REM call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars32.bat"

set SDL2_PATH=C:\dev\SDL2
set GLM_PATH=..\
set IMGUI_PATH=..\imgui
set IMGUI_BACKEND_PATH=..\imgui\backends

set SOURCE_FILES=..\src\*.cpp ..\imgui\*.cpp ..\imgui\backends\imgui_impl_sdl2.cpp ..\imgui\backends\imgui_impl_sdlrenderer2.cpp
set OUTPUT_EXE=my_program.exe

REM Set additional compiler and linker options if needed
set COMPILER_OPTIONS=/EHsc /Zi
set LINKER_OPTIONS=/SUBSYSTEM:WINDOWS Shell32.lib

REM Set library paths and libraries
set LIB_PATHS=C:\dev\SDL2\lib\x86
set LIBRARIES=SDL2main.lib SDL2_ttf.lib SDL2.lib SDL2_image.lib SDL2_mixer.lib

REM Compile source files

cl %COMPILER_OPTIONS% %SOURCE_FILES% /Fe%OUTPUT_EXE% /I %SDL2_PATH% /I %GLM_PATH% /I %IMGUI_PATH% /I %IMGUI_BACKEND_PATH% /link /LIBPATH:%LIB_PATHS% %LIBRARIES% %LINKER_OPTIONS%

REM Clean up unnecessary files
del *.ilk *.obj *.pdb

REM Display any error messages
if errorlevel 1 (
    echo Compilation failed.
) else (
    echo Compilation successful.
)

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo off

REM Set the path to the Visual Studio environment variables
REM call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars32.bat"

REM Set source files, object files, and output executable name
set SOURCE_FILES=src\main.cpp src\other_file.cpp
set OBJECT_FILES=obj\main.obj obj\other_file.obj
set OUTPUT_EXE=my_program.exe

REM Set additional compiler and linker options if needed
set COMPILER_OPTIONS=/EHsc
set LINKER_OPTIONS=

REM Set library paths and libraries
set LIB_PATHS=
set LIBRARIES=path\to\library1.lib path\to\library2.lib

REM Compile each source file
for %%i in (%SOURCE_FILES%) do (
    cl.exe %COMPILER_OPTIONS% /c %%i /Foobj\
)

REM Link the object files into the executable
cl.exe %LINKER_OPTIONS% %OBJECT_FILES% /Fe%OUTPUT_EXE% %LIB_PATHS% %LIBRARIES%

REM Check if the compilation was successful
if %errorlevel% neq 0 (
    echo Compilation failed!
) else (
    echo Compilation successful!
)

REM Pause to keep the command prompt window open
pause


:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
if exist "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" (
    call "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" x86
) else (
    call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvarsall.bat" x86
)
set compilerflags=/Od /MD /Zi /EHsc /std:c++latest /nologo /I include /I C:\Boost /I "C:\Program Files (x86)\MySQL\MySQL Connector C++ 8.0\include" /I "C:\Program Files (x86)\Visual Leak Detector\include"
set linkerflags=/OUT:bin\program_name.exe /NOLOGO /DEBUG /LIBPATH:C:\Boost\stage\lib /LIBPATH:"C:\Program Files (x86)\MySQL\MySQL Connector C++ 8.0\lib" /DEFAULTLIB:"C:\Program Files (x86)\MySQL\MySQL Connector C++ 8.0\lib\vs14\mysqlcppconn.lib"
cl.exe %compilerflags% src\*.cpp /link %linkerflags%
del bin\*.ilk *.obj *.pdb

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off

::Debug flags
::set compiler_flags=/Zi /D_DEBUG /Od

::Release flags
set compiler_flags=/O2

pushd ".\build"
    cl %compiler_flags% /D_USRDLL /D_WINDLL ..\src\nes.cpp opengl32.lib glew32.lib /link /DLL /OUT:NES.dll 
    cl %compiler_flags% ..\src\win32_nes.cpp user32.lib gdi32.lib winmm.lib comdlg32.lib opengl32.lib glew32.lib
popd

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off
:: Check for vcvarsall.bat and call it to set up the environment
if exist "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" (
    call "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" x86
) else (
    call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvarsall.bat" x86
)

:: Set compiler and linker flags
set compilerflags=/Od /MD /Zi /EHsc /std:c++latest /nologo /I include /I C:\Boost /I "C:\Program Files (x86)\MySQL\MySQL Connector C++ 8.0\include" /I "C:\Program Files (x86)\Visual Leak Detector\include"
set linkerflags=/OUT:bin\program_name.exe /NOLOGO /DEBUG /LIBPATH:C:\Boost\stage\lib /LIBPATH:"C:\Program Files (x86)\MySQL\MySQL Connector C++ 8.0\lib" /DEFAULTLIB:"C:\Program Files (x86)\MySQL\MySQL Connector C++ 8.0\lib\vs14\mysqlcppconn.lib"

:: Compile the source files and link
cl.exe %compilerflags% src\*.cpp /link %linkerflags%

:: Clean up intermediate files
del bin\*.ilk *.obj *.pdb

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo off

REM Set the path to the Visual Studio environment variables
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"

REM Set source files, object files, and output executable name
set SOURCE_FILES=src\main.cpp src\other_file.cpp
set OBJECT_FILES=obj\main.obj obj\other_file.obj
set OUTPUT_EXE=my_program.exe

REM Set additional compiler and linker options if needed
set COMPILER_OPTIONS=/EHsc
set LINKER_OPTIONS=/nologo /subsystem:console

REM Set library paths and libraries
set LIB_PATHS=path\to\library1_directory
set LIBRARIES=library1.lib path\to\library2.lib


REM Compile each source file
for %%i in (%SOURCE_FILES%) do (
    cl.exe %COMPILER_OPTIONS% /c %%i /Foobj\
)

REM Link the object files into the executable
cl.exe %LINKER_OPTIONS% %OBJECT_FILES% /Fe%OUTPUT_EXE% %LIB_PATHS% %LIBRARIES%

REM Check if the compilation was successful
if %errorlevel% neq 0 (
    echo Compilation failed!
) else (
    echo Compilation successful!
)

REM Pause to keep the command prompt window open
pause

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo off

REM Set the path to the Visual Studio environment variables
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"

REM Set source files, object files, and output executable name
set SOURCE_FILES=^
    src\Game.cpp ^    
    src\Logger\Logger.cpp ^
    src\ECS\ECS.cpp ^
    src\Components\TransformComponent.cpp ^
    src\Components\RigidBodyComponent.cpp ^
    src\Components\SpriteComponent.cpp ^
    src\Components\AnimationComponent.cpp ^
    src\Components\BoxColliderComponent.cpp ^
    src\Components\KeyboardControlledComponent.cpp ^
    src\Components\CameraFollowComponent.cpp ^
    src\Components\ProjectileEmitterComponent.cpp ^
    src\Components\HealthComponent.cpp ^
    src\Systems\MovementSystem.cpp ^
    src\Systems\CameraMovementSystem.cpp ^
    src\Systems\RenderSystem.cpp ^
    src\Systems\AnimationSystem.cpp ^
    src\Systems\CollisionSystem.cpp ^
    src\Systems\RenderColliderSystem.cpp ^
    src\Systems\DamageSystem.cpp ^
    src\Systems\ProjectileEmitSystem.cpp ^
    src\Systems\KeyboardControlSystem.cpp ^
    src\Systems\ProjectileLifecycleSystem.cpp
set OBJECT_FILES=^
    obj\Game.obj ^
    obj\Logger.obj ^
    obj\ECS.obj ^
    obj\TransformComponent.obj ^
    obj\RigidBodyComponent.obj ^
    obj\SpriteComponent.obj ^
    obj\AnimationComponent.obj ^
    obj\BoxColliderComponent.obj ^
    obj\KeyboardControlledComponent.obj ^
    obj\CameraFollowComponent.obj ^
    obj\ProjectileEmitterComponent.obj ^
    obj\HealthComponent.obj ^
    obj\MovementSystem.obj ^
    obj\CameraMovementSystem.obj ^
    obj\RenderSystem.obj ^
    obj\AnimationSystem.obj ^
    obj\CollisionSystem.obj ^
    obj\RenderColliderSystem.obj ^
    obj\DamageSystem.obj ^
    obj\ProjectileEmitSystem.obj ^
    obj\KeyboardControlSystem.obj ^
    obj\ProjectileLifecycleSystem.obj
set OUTPUT_EXE=my_game.exe

REM Set additional compiler and linker options if needed
set COMPILER_OPTIONS=/EHsc /Iinclude /Isrc /std:c++17
set LINKER_OPTIONS=/nologo /subsystem:console

REM Set library paths and libraries
set LIB_PATHS=
set LIBRARIES=SDL2.lib SDL2_image.lib glm.lib

REM Compile each source file
for %%i in (%SOURCE_FILES%) do (
    cl.exe %COMPILER_OPTIONS% /c %%i /Foobj\
)

REM Link the object files into the executable
cl.exe %LINKER_OPTIONS% %OBJECT_FILES% /Fe%OUTPUT_EXE% %LIB_PATHS% %LIBRARIES%

REM Check if the compilation was successful
if %errorlevel% neq 0 (
    echo Compilation failed!
) else (
    echo Compilation successful!
)

REM Pause to keep the command prompt window open
pause

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
REM ANOTHER EXAMPLE OF BUILD SCRIPT
@echo off

REM Set the environment variables for the Visual Studio Command Prompt
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars32.bat"

REM Set source files, object files, and output executable name
set SOURCE_FILES=..\src\*.cpp ..\imgui\*.cpp
set OUTPUT_EXE=my_program.exe

REM Set additional compiler and linker options if needed
set COMPILER_OPTIONS=/EHsc /Zi
set LINKER_OPTIONS=

REM Set library paths and libraries
set LIB_PATHS=C:\dev\SDL2\lib\x86
set LIBRARIES=SDL2main.lib SDL2_ttf.lib SDL2.lib SDL2_image.lib SDL2_mixer.lib 

REM Set include paths
set INCLUDE_PATHS=C:\dev\SDL2;C:\Users\harry\Development\SDL-Game C_C++\RedBob_ver_0.2\RedBob_ver_0.2;C:\Users\harry\Development\SDL-Game C_C++\RedBob_ver_0.2\RedBob_ver_0.2\imgui;C:\Users\harry\Development\SDL-Game C_C++\RedBob_ver_0.2\RedBob_ver_0.2\imgui\backends

REM Compile source files
cl %COMPILER_OPTIONS% %SOURCE_FILES% /Fe%OUTPUT_EXE% /I"%INCLUDE_PATHS%" /link %LIB_PATHS% %LIBRARIES% %LINKER_OPTIONS%

REM Clean up unnecessary files
del bin\*.ilk *.obj *.pdb

REM Display any error messages
if errorlevel 1 (
    echo Compilation failed.
) else (
    echo Compilation successful.
)
