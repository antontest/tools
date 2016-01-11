#! /bin/bash
# Name : gen_certs.sh
# Func : generate certificate
# Time : 2015-12-23 13:04:47

OUTFORM=pem
DFT_TYPE=rsa
DFT_LIFETIME=3650

CERT_GEN_PATH=/home/anton/test
CA_PATH=$CERT_GEN_PATH/ca
CERT_PATH=$CERT_GEN_PATH/certs
PKG_PATH=$CERT_GEN_PATH/pkg

PKG_CERTS_NAME=certs.tar
CA_CERT_NAME=sc_ca_cert.$OUTFORM
CA_PRIVATE_KEY_NAME=sc_ca_private_key.$OUTFORM
CA_PRIVATE_KEY=$CA_PATH/$CA_PRIVATE_KEY_NAME
CA_CERT=$CA_PATH/$CA_CERT_NAME

show_usage (){
    echo "Usage: gen_certs.sh ModelName CSN"
}

gen_cert() {
    test ! -e $CA_PRIVATE_KEY -o ! -e $CA_CERT && echo "CA Certificate loss!" && exit 1

    private_key=$PKG_PATH/ipsec.d/private/key
    public_key=$PKG_PATH/ipsec.d/public_key.$OUTFORM
    cert=$PKG_PATH/ipsec.d/certs/sc_cert.$OUTFORM

    cert_dn="C=CN, O=Sercomm, CN=$1 $2"
    ipsec pki --gen --type $DFT_TYPE --size 2048 --outform $OUTFORM > $private_key
    ipsec pki --pub --in $private_key --outform $OUTFORM > $public_key
    ipsec pki --issue --lifetime $DFT_LIFETIME --in $public_key --cacert $CA_CERT --cakey $CA_PRIVATE_KEY --dn "$cert_dn" --outform $OUTFORM > $cert 
}

pkg_certs (){
    cp -f $CA_CERT $PKG_PATH/ipsec.d/cacerts/

    cd $PKG_PATH && tar -cf $certs_pkg_path ipsec.d && echo "Certificate packet successfully!"
    rm -f $private_key $public_key $cert $PKG_PATH/ipsec.d/cacerts/* 
}

backup_certs() {
    test ! -d $cert_path && mkdir -p $cert_path
    test ! -e "$cert_path/$PKG_CERTS_NAME" && cp $certs_pkg_path $cert_path
}

main() {
    test $# -lt 2 && show_usage && exit 1

    csn_exp="1501AWH000066"
    csn_len=${#csn_exp}
    test "$1" != "F200-GS" -a "$1" != "F200-GN" && echo "Please input right ModelName!" && exit 1
    test ${#2} -ne $csn_len && echo "CSN length wrong!" && exit 1

    certs_pkg_path=`pwd`/$PKG_CERTS_NAME
    test -e $certs_pkg_path && rm -f $certs_pkg_path

    model_path=$CERT_PATH/$1
    test ! -d $model_path && mkdir $model_path
    cert_path=$model_path/`date "+%y_%m"`/$2
    
    if test ! -e "$cert_path/$PKG_CERTS_NAME" ; then 
        gen_cert $@
        pkg_certs
        backup_certs
    else
        cp $cert_path/$PKG_CERTS_NAME $certs_pkg_path
    fi
}

main $@
exit 0
