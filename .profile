# Code for Login Sessions Only
use () { eval `/usr/local/packages/usepackage/bin/usepackage -b $*` ; }

#-------------------------#
# BASE - UTILITY          #
#-------------------------#
exists() {
    test -x "`type -P "$1" 2>/dev/null`"
}

#-------------------------#
# ENVIRONMENT - LOCALE    #
#-------------------------#
export LANGUAGE="en_GB:en_US:en"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE=$LC_ALL
export LANG=$LANGUAGE
export LC_COLLATE="C"

#-------------------------#
# SHELL - CHECK TYPE      #
#-------------------------#
[[ $- != *i* ]] && return

#-----------------------------#
# ENVIRONMENT - APPLICATIONS  #
#-----------------------------#
exists lesspipe.sh && \
    export LESSOPEN="|lesspipe.sh %s"
export LESS="-i -M -R -W -S -x4"
export PAGER=less
export GREP_COLOR=31
#export GREP_OPTIONS="--color=always"
export NOSPLASH=1
export NOWELCOME=1
export EDITOR=vim VISUAL=vim

#------------------------------#
# usepackage derived variables #
#------------------------------#
# use GLOBAL
export PATH=/usr/local/common:/usr/lib64/qt-3.3/bin:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:/opt/real/RealPlayer
export MANPATH=/usr/local/man:/usr/local/common/man:/usr/man:/usr/share/man:/usr/X11R6/man:/opt/gnome/share/man:/usr/openwin/man:$MANPATH
export HOST="`uname -n`"
export GLOBAL_PATH=/usr/local/global.files
export PRINTER="`cat ~/.defaultprinter`"
export WWW_HOME="http://www.jcvi.org"
export TITLE="${USER}@$HOST%"
export OSVERSION="`uname -r`"
export RELEASE="`uname -r`"
export MACHINE="`uname -n`"
export RSYNC_RSH="ssh"
export JAVA_HOME=/usr/local/java/current
export JAVA_BINDIR=${JAVA_HOME}/bin
export JAVA_ROOT=${JAVA_HOME}
export JRE_HOME=${JAVA_HOME}/jre
export JDK_HOME=${JAVA_HOME}
export SDK_HOME=${JAVA_HOME}
export JDBC_HOME=/usr/local/common/jConnect-6_0
export CLASSPATH=.:${JDBC_HOME}/classes/jconn3.jar

# use shell
ulimit -s unlimited >& /dev/null
ulimit -Sc 0 >& /dev/null
umask 002

# use phred
export PHRED_PARAMETER_FILE=/usr/local/etc/PhredPar/phredpar.dat

# use tmake
export TMAKEPATH=/usr/local/packages/tmake/lib/linux-g++

# use polybaye
export POLYBAYES_LIB=/usr/local/packages/PolyBayes_3_0/lib

# use cvs
export CVSROOT=":ext:${USER}@cvs.jcvi.org:/usr/local/src/cvsroot"

# use sybase
export SYBASE=/usr/local/packages/sybase
export DSQUERY="SYBPROD"
export LD_LIBRARY_PATH=/usr/local/packages/sybase/OCS/lib

# use ANNOTATION_ENV
export ANNOTATION_DIR=/usr/local/annotation

# use EGC
export ANNOT_DEVEL=/usr/local/devel/ANNOTATION
export EGC_SCRIPTS=${ANNOT_DEVEL}/vkrishna/euk_genome_control
export EGC_UTILITIES=${ANNOT_DEVEL}/vkrishna/EGC_utilities/bin
export EUK_MODULES=${ANNOT_DEVEL}/vkrishna/Euk_modules

# use hmm
export HMMER_NCPU="1"
export HMM_SCRIPTS=${ANNOT_DEVEL}/hmm/bin

# emboss env
#export EMBOSS_ACDROOT=/usr/local/packages/EMBOSS/share/EMBOSS/acd
#export PLPLOT_LIB=/usr/local/packages/EMBOSS/share/EMBOSS
#export EMBOSS_DATA=/usr/local/packages/EMBOSS/share/EMBOSS/data

gnuplot=/usr/local/packages/gnuplot-4.2.6/bin/gnuplot

#------------------------------------------------------------------------------
# Put your additions/changes below
export PATH=.:/export/firefox:/export/thunderbird:/usr/local/genome/bin:${EGC_UTILITIES}:${EUK_MODULES}:${EGC_SCRIPTS}:/usr/local/scratch/EUK/vkrishna/bin:${HOME}/bin/eval:${HOME}/bin/icommands:/export/bin:${HOME}/.perl-shell:${HOME}/bin/x86_64:${HOME}/bin:$PATH:/home/sgeworker/bin:/usr/sbin:/sbin
##PATH=/usr/local/projects/tgi/bin:

export LD_LIBRARY_PATH=/usr/local/scratch/EUK/vkrishna/lib:${HOME}/lib:/usr/local/lib:/export/lib:/usr/local/packages/postgresql/lib/:/usr/local/packages/bzip2/lib:/usr/local/packages/gcc-4.6.2/lib64:/usr/local/packages/mysql/lib/mysql:$LD_LIBRARY_PATH
export MYSQLINC=/usr/local/packages/mysql/include/mysql
export MYSQLLIBS="/usr/local/packages/mysql/lib/mysql/libmysqlclient.a -lz"
export PKG_CONFIG_PATH=/usr/local/packages/glib/lib/pkgconfig:/usr/lib/pkgconfig

# Programming specific ENV variables
export PERL5LIB=${HOME}/lib:${HOME}/git.local/jcvi/db/lib:${EUK_MODULES}:${EGC_SCRIPTS}:${HOME}/lib/eval:${ANNOT_DEVEL}/iprscan/iprscan_v4.7/lib
export PYTHONPATH=/usr/local/packages/python/lib/python2.6/site-packages

if [ $HOST == "spike.jcvi.org" ]; then
    export BQVERSION="bisque-0.5.0"
    export BISQUE_ROOT=/opt/www/maize-bisque
    export BQENV_DIR=${BQVERSION}/bqenv
    export PATH=${BISQUE_ROOT}/bin:${BISQUE_ROOT}/${BQENV_DIR}/bin:$PATH
    export LD_LIBRARY_PATH=${BISQUE_ROOT}/lib:$LD_LIBRARY_PATH
    export LD_RUN_PATH=${BISQUE_ROOT}/lib:$LD_RUN_PATH
    export PYTHONPATH=${BISQUE_ROOT}/lib/python2.6/site-packages:${BISQUE_ROOT}/bisque-0.5.0/bqenv/lib/python2.6/site-packages:$PYTHONPATH
else
    export PYTHONPATH=${HOME}/git:$PYTHONPATH:${HOME}/lib/python2.6/site-packages
fi

# Medicago/Annotation specific
export GBROWSE=${ANNOT_DEVEL}/vkrishna/GBrowse
export PROJECTS=/usr/local/projects
export MTG3=${PROJECTS}/MTG3
export MTG4=${PROJECTS}/MTG4
export CURRENT=${MTG3}/IMGAG3.5/FINAL_GENE_SET
export BOG=${PROJECTS}/BOG

# InterProScan
export IPRSCAN_HOME=${ANNOT_DEVEL}/iprscan/iprscan_v4.7
export IPRSCAN_LIB=${IPRSCAN_HOME}/lib

# AAT
export AATPATH=/usr/local/bin

export SVNHOME="http://isvn.tigr.org/ANNOTATION"
export TZ="EST5EDT"
export LOGNAME="vkrishna"
export MACHTYPE="x86_64"
export LC_ALL="C"

# Import CentOS grid settings
SGE=/usr/local/sge_current/jcvi/common/settings.sh
if [ -r "$SGE" ]; then . $SGE; else echo "Missing $SGE - contact sysadmin."; fi
export PCODE="04048"

# CURL
export CURL_LIBS=/usr/local/packages/curl/lib
export CURL_CFLAGS=/usr/local/packages/curl/include

# BOOST libs
export BOOST_ROOT=/usr/local/packages/boost

# OPENMP thread number
export OMP_NUM_THREADS=64

# Import Workflow settings
WORKFLOW=${ANNOT_DEVEL}/workflow-3.0B18/exec_env.bash
if [ -r "$WORKFLOW" ]; then . $WORKFLOW; else echo "Missing $WORKFLOW - contact workflow admin."; fi

# Enable git-completion
GITCOMP=~/.git-completion.sh
if [ -r "$GITCOMP" ]; then . $GITCOMP; else echo "Missing $GITCOMP."; fi

# Use java160 by default
use java160

# Custom JCVI login banner
if [ -f "${HOME}/.login" ]; then
  . ${HOME}/.login
fi

# Enable iRODS commands autocomplete
ICMDS=~/.i-commands-auto.bash
if [ -r "$ICMDS" ]; then . $ICMDS; else echo "Missing $ICMDS."; fi
