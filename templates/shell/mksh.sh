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

# \brief get paramters from cmd line
# \param $@ [in] paramters from cmd line
# \return 0, if succ
#        -1, if fail
function parser_args()
{
    TEMP=`getopt -o hi --long help,ignore \
     	-n 'mksh' -- "$@"`

    if [ $? != 0 ] ; then echo "Terminating..." >&2 ; exit 1 ; fi

    # Note the quotes around `$TEMP': they are essential!
    # set 会重新排列参数的顺序，也就是改变$1,$2...$n的值，这些值在getopt中重新排列过了
    eval set -- "$TEMP"

    # 经过getopt的处理，下面处理具体选项。
    while true ; do
        case "$1" in
            -h|--help) print_usage $@; shift ;;
            -i|--ignore) ignore=1 ; shift ;;
            --) shift ; break ;;
            *) echo "Internal error!" ; exit 1 ;;
        esac
    done

    # get others values
    for arg in $@ ; do
        name="$arg"
    done

    return 0
}

