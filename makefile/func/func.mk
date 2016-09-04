#/*************************************************************        
#FileName : makefile library  
#FileFunc : library
#Version  : V0.1        
#Author   : Antonio
#Date     : 2016-09-04   
#*************************************************************/     

# get current directory
define get_cur_path
	`pwd`
endef

# get current directory's name
define get_cur_dir
	`basename $(shell pwd)`
endef

# find files by type
# @1: filetype, like c, cpp, h and so on
# @2: path to find files 
define find_files
	`find $(2) -maxdepth 1 -name "*.$(1)"`
endef

# find files by type
# @1: filetype, like c, cpp, h and so on
# @2: path to find files 
# @3: outdir
define get_objs
	`find $(2) -maxdepth 1 -name "*.$(1)" -exec basename {} \; | sed "s/\.$(1)/.o/g" | sed "s/^/$(3)\/&/g"`
endef

# find files by type
# @1: filetype, like c, cpp, h and so on
# @2: path to find files 
# @3: outdir
define get_deps
	`find $(2) -maxdepth 1 -name "*.$(1)" -exec basename {} \; | sed "s/\.$(1)/.d/g" | sed "s/^/$(3)\/&/g"`
endef

# find dir by name
# @1 directory name, like incs, libs
define find_dir
	$(shell \
		find_path=`pwd`; \
		r=`find $$find_path -maxdepth 1 -iname "$(1)"`; \
		test -n "$$r" && echo $$r && exit 0; \
		find_path=`dirname $$find_path`;\
		r=`find $$find_path -maxdepth 1 -iname "$(1)"`; \
		test -n "$$r" && echo $$r && exit 0; \
		find_path=`dirname $$find_path`;\
		r=`find $$find_path -maxdepth 1 -iname "$(1)"`; \
		test -n "$$r" && echo $$r && exit 0; \
	)
endef
