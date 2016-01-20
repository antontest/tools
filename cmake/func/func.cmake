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

# get library name by path, like src/lib/libhello.a, gets hello
function (get_share_lib_by_path path output)
    string(REGEX REPLACE ".*lib\(.*\).so$" "\\1" opt ${path})
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

# install share library
function(install_shared_lib lib_name install_path)
    INSTALL(TARGETS ${lib_name} LIBRARY DESTINATION ${install_path})
endfunction(install_shared_lib)

# install share library
function(install_static_lib lib_name install_path)
    INSTALL(TARGETS ${lib_name} ARCHIVE DESTINATION ${install_path})
endfunction(install_static_lib)

# install library
function (install_lib src_path install_path)
    file (GLOB_RECURSE alib ${src_path}/*.a)
    file (GLOB_RECURSE solib ${src_path}/*.so)
    set (alllib ${alib} ${solib})

    if (alib)
        foreach(lib ${alib})
            INSTALL(FILES ${lib} DESTINATION ${install_path})
        endforeach()
    endif()

    if (solib)
        foreach(lib ${solib})
            INSTALL(FILES ${lib} DESTINATION ${install_path} PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE)
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

# install library
function (install_lib_file src_path install_path)
    file (GLOB_RECURSE alib ${src_path}/*.a)
    file (GLOB_RECURSE solib ${src_path}/*.so)
    string(TOLOWER ${PROJECT_NAME} proj_name)

    if (solib)
        foreach (shared_lib_path ${solib})
            get_share_lib_by_path(${shared_lib_path} lib_name)
            if (${proj_name} STREQUAL ${lib_name})
                set(lib_name ${lib_name}_shared)
            endif()
            set(shared_lib_name ${shared_lib_name} ${lib_name})
        endforeach(shared_lib_path)

        foreach (shared_lib ${shared_lib_name})
            install_shared_lib(${shared_lib} ${install_path} PERMISSIONS OWNER_READ OWNER_EXECUTE GROUP_READ GROUP_EXECUTE)
        endforeach(shared_lib)
    endif()

    if (alib)
        foreach (static_lib_path ${alib})
            get_lib_by_path(${static_lib_path} lib_name)
            if (${proj_name} STREQUAL ${lib_name})
                set(lib_name ${lib_name}_static)
            endif()
            set(static_lib_name ${static_lib_name} ${lib_name})
        endforeach(static_lib_path)

        foreach(static_lib ${static_lib_name})
            install_static_lib(${static_lib} ${install_path})
        endforeach()
    endif()
endfunction()

# install after build
function (pre_install target)
    if ( PRE_INSTALL  )
        add_custom_command(TARGET ${target}
            POST_BUILD
            COMMAND make "install"
            COMMENT "This command will be executed before build target ${target}"
            )
    endif( PRE_INSTALL  )
endfunction()

function(add_dep target dep)
    ADD_DEPENDENCIES(${target} ${dep})
endfunction(add_dep)
