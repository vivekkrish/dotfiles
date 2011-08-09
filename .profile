# Code for Login Sessions Only
use () { eval `/usr/local/packages/usepackage/bin/usepackage -b $*` ; }

# Custom JCVI login banner
if [ -f "$HOME/.login" ]; then
  . $HOME/.login
fi

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
export HOST="`uname -n`"
export GLOBAL_PATH=/usr/local/global.files
export PRINTER="`cat ~/.defaultprinter`"
export PATH=~/bin:/usr/local/bin:/usr/local/common:/usr/bin:/bin:$PATH
export MANPATH=/usr/local/man:/usr/local/common/man:/usr/man:/usr/share/man:/usr/X11R6/man:/opt/gnome/share/man:/usr/openwin/man:$MANPATH
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

# use hmm
export HMMER_NCPU="1"
export HMM_SCRIPTS=/usr/local/devel/ANNOTATION/hmm/bin

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
#export EGC_SCRIPTS=${ANNOT_DEVEL}/euk_genome_control/bin
export EGC_SCRIPTS=${ANNOT_DEVEL}/vkrishna/euk_genome_control
export EGC_UTILITIES=${ANNOT_DEVEL}/EGC_utilities/bin
#export EUK_MODULES=${ANNOT_DEVEL}/Euk_modules/bin
export EUK_MODULES=/usr/local/devel/ANNOTATION/vkrishna/Euk_modules

#------------------------------------------------------------------------------
# Put your additions/changes below
export PATH=/opt/www/maize-bisque/bin:/export/firefox:/export/thunderbird:/usr/local/genome/bin:/usr/local/devel/ANNOTATION/euk_genome_control/bin:/usr/local/devel/ANNOTATION/EGC_utilities:/usr/local/devel/ANNOTATION/EGC_utilities/bin:/usr/local/devel/ANNOTATION/vkrishna/Euk_modules:/usr/local/devel/ANNOTATION/vkrishna/bin:/home/vkrishna/.perl-shell:/home/vkrishna/bin/x86_64:$PATH:/export/bin:/usr/local/projects/tgi/bin:/home/sgeworker/bin:/usr/sbin:/sbin
export LD_LIBRARY_PATH=/usr/local/packages/mysql/lib/mysql:/opt/www/maize-bisque/lib:/home/vkrishna/lib:/export/lib:$LD_LIBRARY_PATH
export LD_RUN_PATH=/opt/www/maize-bisque/lib:/opt/www/maize-bisque/bisque/bqenv/lib/python2.5/site-packages:/opt/www/maize-bisque/lib/python2.5/site-packages
export MYSQLINC=/usr/local/packages/mysql/include/mysql
export MYSQLLIBS="/usr/local/packages/mysql/lib/mysql/libmysqlclient.a -lz"

# Programming specific ENV variables
export PERL5LIB=/home/vkrishna/lib:/home/vkrishna/git.local/jcvi/db/lib
export PYTHONPATH=/home/vkrishna/git:/opt/www/maize-bisque/bisque/bqenv/lib/python2.5/site-packages:/home/vkrishna/lib/python2.6/site-packages

# Medicago/Annotation specific
export GBROWSE=/usr/local/devel/ANNOTATION/vkrishna/GBrowse
export MTG3=/usr/local/projects/MTG3
export IMGAG35="/usr/local/projects/MTG3/IMGAG3.5"
export MTG4=/usr/local/projects/MTG4

export SVNHOME="http://isvn.tigr.org/ANNOTATION"
export TZ="EST5EDT"
export LOGNAME="vkrishna"
export MACHTYPE="x86_64"
export LC_ALL="C"

# Import CentOS grid settings
SGE=/usr/local/sge_current/jcvi/common/settings.sh
if [ -r "$SGE" ]; then . $SGE; else echo "Missing $SGE - contact sysadmin."; fi
export PCODE="04048"

# Import Workflow settings
WORKFLOW=/usr/local/devel/ANNOTATION/workflow-3.0B18/exec_env.bash
if [ -r "$WORKFLOW" ]; then . $WORKFLOW; else echo "Missing $WORKFLOW - contact jinman@jcvi.org."; fi

# Use java160 by default
use java160
