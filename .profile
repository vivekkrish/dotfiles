#.profile
# Set the users environment variables

#-------------------------#
# ENVIRONMENT - LOCALE    #
#-------------------------#
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="$LC_ALL"
export LC_COLLATE="$LC_ALL"

#-----------------------------#
# ENVIRONMENT - APPLICATIONS  #
#-----------------------------#
export LESSOPEN="|lesspipe.sh %s"
export LESS="-i -M -R -W -S -x4 -X"
export PAGER=less
export GREP_COLOR=31
#export GREP_OPTIONS="--color=always"
export NOSPLASH=1
export NOWELCOME=1
export EDITOR=vim VISUAL=vim
export IGNOREEOF=2

#------------------------------#
# usepackage derived variables #
#------------------------------#
# use GLOBAL
export HOST="`uname -n`"
export GLOBAL_PATH=/usr/local/global.files
export PRINTER="`cat ~/.defaultprinter`"
export WWW_HOME="http://www.jcvi.org"
export TITLE="${USER}@$HOST%"
export OSVERSION="`uname -r`"
export RELEASE="`uname -r`"
export MACHINE="`uname -n`"
export RSYNC_RSH="ssh"
#export JAVA_HOME=/usr/local/java/current
#export JAVA_BINDIR=${JAVA_HOME}/bin
#export JAVA_ROOT=${JAVA_HOME}
#export JRE_HOME=${JAVA_HOME}/jre
#export JDK_HOME=${JAVA_HOME}
#export SDK_HOME=${JAVA_HOME}
#export JDBC_HOME=/usr/local/common/jConnect-6_0
#export CLASSPATH=.:${JDBC_HOME}/classes/jconn3.jar

# PREFIX_PATH
#PREFIX_PATH=/home/vkrishna

# local/packages
PACKAGES=/usr/local/packages

# use ANNOTATION_ENV
export ANNOTATION_DIR=/usr/local/annotation

# use EGC
export ANNOT_DEVEL=/usr/local/devel/ANNOTATION
export EGC_UTILITIES=${ANNOT_DEVEL}/EGC_utilities/bin
export EGC_SCRIPTS=${ANNOT_DEVEL}/vkrishna/euk_genome_control
export EUK_MODULES=${ANNOT_DEVEL}/vkrishna/Euk_modules
export EUK_ORGANIZATION=${ANNOT_DEVEL}/vkrishna/EUK_ORGANIZATION

# Medicago/Annotation specific
export PROJECTS=/usr/local/projects
export MTG3=${PROJECTS}/MTG3
export MTG4=${PROJECTS}/MTG4
export CURRENT=${MTG4}/A17/Current_annotation
export MTA4=/usr/local/annotation/MTA4

# Other annotation projects
export BOG=${PROJECTS}/BOG
export WILLOW=${PROJECTS}/WILLOW
export GBROWSE=${ANNOT_DEVEL}/vkrishna/GBrowse

# AIP specific paths
AIP_HOME=${PROJECTS}/AIP
TAIR_DATA=DataProviders/TAIR
TAIR10_RELEASE=ftp.arabidopsis.org/Genes/TAIR10_genome_release

# machtype
export MACHTYPE="x86_64"

# Amazon EC2 Private Key
export EC2_PRIVATE_KEY=/usr/local/projects/MTG4/Workshop2014/AWS/jcvi_workshop_2014-$USER.pem

# PASA
#export PASAHOME=${MTG4}/packages/PASA2
export PASAHOME=${ANNOT_DEVEL}/PASA

# Trinity
export TRINITY_HOME=${AIP_HOME}/local/packages/trinityrnaseq

# JBrowse
export JBROWSE=${MTG4}/packages/JBrowse-current

# NCBI-BLAST+
export BLASTPLUS=${PACKAGES}/ncbi-blast+/bin

# MAKER HOME
export MAKER_HOME=${MTG4}/packages/maker

# AUGUSTUS
export AUGUSTUS_CONFIG_PATH=${PACKAGES}/augustus/config

# PATH
RPATH="${HOME}/bin|/opt/real/RealPlayer|/usr/local/bin|/usr/local/sbin"
PATH=$( echo ${PATH} | tr -s ":" "\n" | grep -vwE "(${RPATH})" | tr -s "\n" ":" | sed "s/:$//" )

if [[ "${HOSTNAME}" == "itchy" ]]; then
    ## itchy.jcvi.org specific configuration for BISQUE
    export BQROOT=/opt/www/maize-bisque
    #export BQVERSION="bisque-053"

    PATH=${BQROOT}/bin:/usr/local/bin:/usr/local/sbin:${PATH}:{$HOME}/bin
    LD_LIBRARY_PATH=${PACKAGES}/percona-server/lib:${BQROOT}/lib:${PACKAGES}/fftw/lib:${PACKAGES}/gcc-4.7.1/lib64:${PACKAGES}/python/lib:/usr/local/lib64:${HOME}/lib
    PKG_CONFIG_PATH=${BQROOT}/lib/pkgconfig
    PYTHONPATH=${BQROOT}/lib/python2.7/site-packages
    HDF5_DIR=/usr/local/packages/hdf5
elif [[ "${HOSTNAME}" == "columbia" ]]; then
    PATH=/opt/admin/bin:${AIP_HOME}/local/bin:/opt/www/araport/bin:/usr/local/bin:/usr/local/sbin:${HOME}/bin:${PATH}:/usr/local/projects/AIP/vkrishna/git/foundation-cli/bin
    LD_LIBRARY_PATH=${AIP_HOME}/local/lib:/opt/www/araport/lib:${PACKAGES}/gcc-4.7.1/lib64:${PACKAGES}/python/lib:/usr/local/lib:${HOME}/lib
    PYTHONPATH=${HOME}/git:${PACKAGES}/python/lib/python2.7/site-packages:${HOME}/lib/python2.7/site-packages:/home/htang/lib/python2.7/site-packages:${HOME}/lib/python2.6/site-packages
    PERL5LIB=${AIP_HOME}/local/lib
else
    # PATH
    PATH=${AIP_HOME}/local/bin:/export/apache2/bin:/export/php/bin:/export/bin:${HOME}/.gem/ruby/1.9.1/bin:${HOME}/bin/eval:${HOME}/bin/icommands:${HOME}/.perl-shell:${HOME}/bin/${MACHTYPE}:${HOME}/bin:${EGC_SCRIPTS}:${EGC_UTILITIES}:${EUK_MODULES}:${BLASTPLUS}:/usr/local/bin:/usr/local/sbin:${MAKER_HOME}/bin:${MTG4}/local/bin:/usr/local/genome/bin:/usr/local/common:${PATH}:/usr/local/projects/AIP/vkrishna/git/foundation-cli/bin
    PATH=${PATH}:/home/sgeworker/bin:/usr/sbin:/sbin:/opt/real/RealPlayer

    # LD_LIBRARY_PATH
    LD_LIBRARY_PATH=${AIP_HOME}/local/lib:/export/lib:${PACKAGES}/gcc-4.7.1/lib64:${PACKAGES}/samtools/lib:${PACKAGES}/bzip2/lib:${PACKAGES}/python/lib:${PACKAGES}/sybase/OCS/lib:/usr/local/lib:${HOME}/lib:/usr/lib64:${MTG4}/local/lib

    # PYTHONPATH
    PYTHONPATH=${HOME}/git:${PACKAGES}/python/lib/python2.7/site-packages:${HOME}/lib/python2.7/site-packages:/home/htang/lib/python2.7/site-packages:${HOME}/lib/python2.6/site-packages:${MTG4}/packages/clean_reads

    # clean_reads and seq_crumbs
    CLEAN_READS=${MTG4}/packages/clean_reads
    SEQ_CRUMBS=${MTG4}/packages/seq_crumbs

    # PERL5LIB
    #PERL5LIB=${HOME}/lib:${HOME}/lib/eval:${HOME}/git.local/jcvi/db/lib:${EUK_MODULES}:${EGC_SCRIPTS}
    PERL5LIB=${AIP_HOME}/local/lib:${HOME}/git.local/jcvi/db/lib:${EUK_MODULES}:${EGC_SCRIPTS}

    # PKG_CONFIG_PATH
    PKG_CONFIG_PATH=/usr/lib/pkgconfig:${PACKAGES}/glib/lib/pkgconfig

    # ANT_OPTS
    export ANT_OPTS="-server -XX:MaxPermSize=256M -Xmx1700m -XX:+UseParallelGC -Xms700m -XX:SoftRefLRUPolicyMSPerMB=1 -XX:MaxHeapFreeRatio=99"

    ## CHADO
    export GMOD_ROOT=/usr/local/projects/AIP/vkrishna/gmod
    export CHADO_DB_NAME=chadotest1
    export CHADO_DB_USERNAME=vkrishna
    export CHADO_DB_PASSWORD=vkrishna9
    export CHADO_DB_HOST=localhost
    export CHADO_DB_PORT=5432
fi
PKG_CONFIG_PATH=$PKG_CONFIG_PATH:${HOME}/lib/pkgconfig

export PATH LD_LIBRARY_PATH PYTHONPATH PKG_CONFIG_PATH PERL5LIB

# use phred
export PHRED_PARAMETER_FILE=/usr/local/etc/PhredPar/phredpar.dat

# use tmake
export TMAKEPATH=${PACKAGES}/tmake/lib/linux-g++

# use polybaye
export POLYBAYES_LIB=${PACKAGES}/PolyBayes_3_0/lib

# use cvs
export CVSROOT=":ext:${USER}@cvs.jcvi.org:/usr/local/src/cvsroot"

# use sybase
export SYBASE=${PACKAGES}/sybase
export LANG="en_US.UTF-8"
export DSQUERY="SYBPROD"

# EVM
export EVM=${ANNOT_DEVEL}/EVidenceModeler

# use hmm
export HMMER_NCPU="1"
export HMM_SCRIPTS=${ANNOT_DEVEL}/hmm/bin

# InterProScan
export IPRSCAN_HOME=${ANNOT_DEVEL}/iprscan/iprscan_v4.7
export IPRSCAN_LIB=${IPRSCAN_HOME}/lib

# AAT
export AATPATH=/usr/local/bin

export SVNHOME="http://isvn.tigr.org/ANNOTATION"
export TZ="EST5EDT"
export LOGNAME="vkrishna"

# CURL
export CURL_LIBS=${PACKAGES}/curl/lib
export CURL_CFLAGS=${PACKAGES}/curl/include

# BOOST libs
export BOOST_ROOT=${PACKAGES}/boost

# OPENMP thread number
export OMP_NUM_THREADS=64

# MYSQL
export MYSQLINC=${PACKAGES}/percona-server/include/mysql
export MYSQLLIBS="${PACKAGES}/percona-server/lib/mysql/libperconaserverclient.a -lz"

# use shell
ulimit -s unlimited >& /dev/null
ulimit -Sc 0 >& /dev/null
umask 002

# Import custom ENV
if [[ ${HOSTNAME} != "itchy" ]]; then
    export PCODE="0372"
    export EMAIL="vkrishna@jcvi.org"

    SGE=/usr/local/sge_current/jcvi/common/settings.sh
    WORKFLOW=${ANNOT_DEVEL}/workflow-3.1.3/exec_env.bash
    JAVA160=/usr/local/common/env/java6.sh
    JAVA170=/usr/local/common/env/java7.sh
    GITCOMP=${HOME}/.git-completion.sh
    ICMDS=~/.i-commands-auto.bash

    declare -a ENVVARS=(SGE WORKFLOW JAVA170 GITCOMP ICMDS)
    for i in ${ENVVARS[@]}; do
        eval ENVVAR=\$$i
        if [ -r "$ENVVAR" ]; then
            if [ "$PS1" ]; then
                . "$ENVVAR"
            else
                . "$ENVVAR" >/dev/null 2>&1
            fi
        fi
    done
fi

# MANPATH
MANPATH=${HOME}/share/man:/usr/local/common/man:${MANPATH}
MANPATH=${MANPATH}:/usr/man:/usr/X11R6/man:/opt/gnome/share/man:/usr/openwin/man
export MANPATH

#-------------------------#
# SHELL - CHECK TYPE      #
#-------------------------#
#[[ $- != *i* ]] && return
