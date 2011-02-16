#!/bin/bash
SD=$(dirname $(readlink -f $0))
BD=`cd $SD/../;pwd`

lib=${BD}/lib
binsrc=${BD}/src/main
libsrc=${BD}/src/lib

CC=mxmlc

CCFLAGS=" ${binsrc}/Main.as"
# CCFLAGS+=" -debug=true"
CCFLAGS+=" -static-link-runtime-shared-libraries=true"

CCFLAGS+=" -library-path+=${lib}/GreenSock.swc"
# CCFLAGS+=" -library-path+=${lib}/demonsters.swc"
# CCFLAGS+=" -library-path+=${lib}/tao.swc"
# CCFLAGS+=" -library-path+=${lib}/PureMVC.swc"
# CCFLAGS+=" -library-path+=${lib}/asynccommand.swc"
# CCFLAGS+=" -library-path+=${lib}/AsWing.swc"
CCFLAGS+=" -library-path+=${lib}/ziparchive0.2.swc"

CCFLAGS+=" -sp+=${libsrc}/demonsters"
CCFLAGS+=" -sp+=${libsrc}/puremvc_multicore"
CCFLAGS+=" -sp+=${libsrc}/asynccommand"
CCFLAGS+=" -sp+=${libsrc}/aswing"
CCFLAGS+=" -sp+=${libsrc}/skinbuilder"

CCFLAGS+=" -o ${BD}/build/Main.swf"

(
    echo $CC $CCFLAGS

    while : 
    do read n 
        case $n in 
            r)  # 重新编译
                echo compile 1
                ;; 
            q)  # 退出
                exit
                ;; 
        esac 
    done
) | fcsh
