
# \brief printf usage of shell script
# \param $@ [in] paramters from cmd line
# \return 0, if succ
#        -1, if fail
function print_usage()
{
    echo -e "\e[1;31m#-------------------Shell Usage------------------#"
    echo "Usage  : $(basename $0) [options] script-name"
    echo "Options: "
    echo "     -h,--help    Show usage of shell"
    echo "     -i,--ignore  Ignore when detect the script shell is already existed"
    echo -e "#-------------------Shell Usage-------------------#\e[0m"
}
