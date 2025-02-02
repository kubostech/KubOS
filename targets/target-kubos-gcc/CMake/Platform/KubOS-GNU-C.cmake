# Copyright (C) 2014-2015 ARM Limited. All rights reserved.

set(EXPLICIT_INCLUDES "")
if((CMAKE_VERSION VERSION_GREATER "3.4.0") OR (CMAKE_VERSION VERSION_EQUAL "3.4.0"))
    # from CMake 3.4 <INCLUDES> are separate to <FLAGS> in the
    # CMAKE_<LANG>_COMPILE_OBJECT, CMAKE_<LANG>_CREATE_ASSEMBLY_SOURCE, and
    # CMAKE_<LANG>_CREATE_PREPROCESSED_SOURCE commands
    set(EXPLICIT_INCLUDES "<INCLUDES> ")
endif()

# WARNING - This is not the most optimal way to inject the d-bus includes
# But it is more optimal than including a custom .cmake in every project that needs d-bus
# One day we will have a better method for including external libs....
if(TARGET_LIKE_KUBOS_LINUX)
    # For now only include these in x86 linux targets
    # Because we haven't included d-bus in the other target toolchains yet
    if(TARGET_LIKE_X86)
        set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include")
        set(GLOBALLY_LINKED_TARGET_LIBS "${GLOBALLY_LINKED_TARGET_LIBS} -ldbus-1")
    endif()
endif()

# Override the link rules:
set(CMAKE_C_CREATE_SHARED_LIBRARY "echo 'shared libraries not supported' && 1")
set(CMAKE_C_CREATE_SHARED_MODULE  "echo 'shared modules not supported' && 1")
set(CMAKE_C_CREATE_STATIC_LIBRARY "<CMAKE_AR> -cr <LINK_FLAGS> <TARGET> <OBJECTS>")
set(CMAKE_C_COMPILE_OBJECT        "<CMAKE_C_COMPILER> <DEFINES> ${EXPLICIT_INCLUDES}<FLAGS> -o <OBJECT> -c <SOURCE>")
# <LINK_LIBRARIES> is grouped with system libraries so that system library
# functions (e.g. malloc) can be overridden by symbols in <LINK_LIBRARIES>
set(CMAKE_C_LINK_EXECUTABLE       "<CMAKE_C_COMPILER> <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> -Wl,-Map,<TARGET>.map -Wl,--start-group <OBJECTS> <LINK_LIBRARIES> ${GLOBALLY_LINKED_TARGET_LIBS} -lm -lc -lgcc -lm -lc -lgcc -Wl,--end-group -o <TARGET>")


set(CMAKE_C_FLAGS_DEBUG_INIT          "-g -gdwarf-3 ${CMAKE_C_FLAGS}")
set(CMAKE_C_FLAGS_MINSIZEREL_INIT     "-Os -DNDEBUG ${CMAKE_C_FLAGS}")
set(CMAKE_C_FLAGS_RELEASE_INIT        "-Os -DNDEBUG ${CMAKE_C_FLAGS}")
set(CMAKE_C_FLAGS_RELWITHDEBINFO_INIT "-Os -g -gdwarf-3 -DNDEBUG ${CMAKE_C_FLAGS}")
set(CMAKE_INCLUDE_SYSTEM_FLAG_C "-isystem ")


set(CMAKE_ASM_FLAGS_DEBUG_INIT          "-g -gdwarf-3")
set(CMAKE_ASM_FLAGS_MINSIZEREL_INIT     "-Os -DNDEBUG")
set(CMAKE_ASM_FLAGS_RELEASE_INIT        "-Os -DNDEBUG")
set(CMAKE_ASM_FLAGS_RELWITHDEBINFO_INIT "-Os -g -gdwarf-3 -DNDEBUG")
set(CMAKE_INCLUDE_SYSTEM_FLAG_ASM  "-isystem ")

if(YOTTA_CFG_DEBUG_OPTIONS_COVERAGE)
    set(CMAKE_C_LINK_EXECUTABLE         "${CMAKE_C_LINK_EXECUTABLE} -fprofile-arcs -lgcov")
endif()
