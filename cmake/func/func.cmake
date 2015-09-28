CMAKE_MINIMUM_REQUIRED(VERSION 3.1)

# get basename, like class/libclass.so -- class
function (libname path output)
    string(REGEX REPLACE ".*lib\(.*\)\\.\(.*$\)" "\\1" opt ${path})
    set(${output} ${opt} PARENT_SCOPE)
endfunction()

# get library name by path, like src/lib/libhello.a, gets hello
function (get_lib_by_path path output)
    string(REGEX REPLACE ".*lib\(.*\).a$" "\\1" opt ${path})
    set(${output} ${opt} PARENT_SCOPE)
endfunction()

# get files recursely in the path
function (find_files mode path output)
    file (GLOB_RECURSE files ${path}/*.${mode})
    if (files)
        if (${mode} MATCHES "h")
            set (${output} ${files} PARENT_SCOPE)
        else ()
            libname (${files} ${output})
            set (${output} ${${output}} PARENT_SCOPE)
        endif ()
    endif()
endfunction ()

# install head files
function (install_hfiles src_path install_path)
    file (GLOB_RECURSE files ${src_path}/*.h)
    if (files)
        foreach(hfile ${files})
            INSTALL(FILES ${hfile} DESTINATION ${install_path})
        endforeach()
    endif()
endfunction()

# install library
function (install_lib src_path install_path)
    file (GLOB_RECURSE alib ${src_path}/*.a)
    file (GLOB_RECURSE solib ${src_path}/*.so)
    set (alllib ${alib} ${solib})
    if (alllib)
        foreach(lib ${alllib})
            INSTALL(FILES ${lib} DESTINATION ${install_path})
        endforeach()
    endif()
endfunction()

# find libraries in project
function (find_libs path output)
    file (GLOB_RECURSE alib ${path}/*.a)
    file (GLOB_RECURSE solib ${path}/*.so)
    set (alllib ${alib} ${solib})
    if (alllib)
        libname(${alllib} output)
    endif()
endfunction()
