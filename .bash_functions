# varmunge
varmunge () {
    if [ $# = 0 ]; then
        echo "Usage: varmunge ENVNVAR /path/to/add [append]"
        return;
    fi
    OLD_IFS=$IFS

    ENV_VAR_NAME=`echo $1 | tr '[:lower:]' '[:upper:]'`
    DIRS_TO_ADD=$2
    IFS=':' read -a DIRS_ARRAY <<< "$DIRS_TO_ADD"

    IFS=$OLD_IFS

    eval ENV_VAR=\$$ENV_VAR_NAME

    for (( idx=${#DIRS_ARRAY[@]}-1 ; idx>=0 ; idx-- )) ; do
        if ! echo $ENV_VAR | /bin/egrep -q "(^|:)${DIRS_ARRAY[idx]}($|:)" ; then
            if [ -z "$ENV_VAR" ]; then
                ENV_VAR=${DIRS_ARRAY[idx]}
            else
                if [ "$3" = "append" ] ; then
                    ENV_VAR=$ENV_VAR:${DIRS_ARRAY[idx]}
                else
                    ENV_VAR=${DIRS_ARRAY[idx]}:$ENV_VAR
                fi
            fi
        fi
    done

    export ${ENV_VAR_NAME}=$ENV_VAR
}

# extract files based on file extension
function extract()
{
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2) tar xjvf "$1" ;;
            *.tar.gz) tar xzvf "$1" ;;
            *.tar.Z) tar xzvf "$1" ;;
            *.bz2) bunzip2 "$1" ;;
            *.rar) unrar x "$1" ;;
            *.gz) gunzip "$1" ;;
            *.jar) unzip "$1" ;;
            *.tar) tar xf "$1" ;;
            *.tbz2) tar xjvf "$1" ;;
            *.tgz) tar xzvf "$1" ;;
            *.zip) unzip "$1" ;;
            *.Z) uncompress "$1" ;;
            *) echo "'$1' cannot be extracted." ;;
        esac
    else
        echo "'$1' is not a file."
    fi
}

# wget a file and extract
function wgetx()
{
    regex='(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:, .;]*[-A-Za-z0-9\+&@#/%=~_|]'
    if [[ $1 =~ $regex ]]; then
        wget $1
        if [ $? -ne 0 ]; then
            echo "ERROR: Download failed" >&2
            exit 2
        fi

        fname=`basename $1`
        if [[ -e ${fname} ]]; then
            echo "Extracting ${fname}..."
            extract ${fname}
        else
            echo "Error: Something went wrong. ${fname} does not exist! Please try again"
        fi
    else
        echo "Error: Please check if URL '$1' is valid"
    fi
}

function psgrep {
  ps -ef | grep $1 | grep -v -P "grep.*$1"
}

# Shows a "pretty" directory tree from the current directory downward.
tree ()
{
  find . | sed -e 's/[^\/]*\//|---/g' -e 's/-- |/ |/g' | $PAGER
}

# find a string in a set of files
fstr () {
  if [ $# = 0 ]; then
    echo "Usage: fstr \"pattern\" [files]"
    return;
  fi
  SMSO=$(tput smso)
  RMSO=$(tput rmso)
  find . -maxdepth 1 -name "${2:-*}" -type f -print | xargs grep -sin "$1" | sed "s/$1/$SMSO$1$RMSO/gI"
}

#Search google
google ()
{
  w3m "http://www.google.com/search?q=$1";
}

# move filenames to lowercase
lc ()
{
  for file ; do
    filename=${file##*/}
    case "$filename" in
      */*) dirname==${file%/*} ;;
      *) dirname=.;;
    esac
    nf=$(echo $filename | tr A-Z a-z)
    newname="${dirname}/${nf}"
    if [ "$nf" != "$filename" ]; then
      mv "$file" "$newname"
      echo "lc: $file > $newname"
    else
      echo "lc: $file not changed."
    fi
  done
}

# swap 2 filenames around
swap ()
{
  local TMPFILE="tmp.$$"
  cp -p $1 $TMPFILE
  cp -p $2 $1
  cp -p $TMPFILE $2
  rm $TMPFILE
}

# print the header (the first line of input)
# and then run the specified command on the body (the rest of the input)
# use it in a pipeline, e.g. ps | body grep somepattern
body() {
  IFS= read -r header
  printf '%s\n' "$header"
  "$@"
}

# alternative to invoking qsub
# automatically invokes `sge_hold_jid` to capture submitted jobid
Qsub() {
    if [ "$#" -eq 0 ]; then
        qsub -help
        return 1;
    fi

    qsub "$@" | sge_hold_jid
}

# md = mkdir; cd
md() {
    mkdir -p "$1" && cd "$1"
}

# bash hashmap
hinit() {
    rm -f /tmp/hashmap.$1
}

hload() {
    hinit $1
    if [ -e $2 ]; then
        cat $2 > /tmp/hashmap.$1
    else
        echo "Error: File $2 does not exist!"
        exit
    fi
}

hput() {
    echo "$2	$3" >> /tmp/hashmap.$1
}

hget() {
    grep -P "^$2\s+" /tmp/hashmap.$1 | awk '{ print $2 };'
}

function gi() { curl -s https://www.gitignore.io/api/$@ ;}

trouble() { qlogin -P 0611 -l trouble -l hostname=$@ ;}

function adama() {
    export ADAMA=https://api.araport.org/community/v0.3
    http "$@" Authorization:"Bearer $TOKEN"
}

function transfer() {
    if [ $# -eq 0 ]; then
        echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md";
        return 1;
    fi
    tmpfile=$( mktemp -t transferXXX );
    if tty -s; then
        basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g');
        curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile;
    else
        curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ;
    fi;
    cat $tmpfile; rm -f $tmpfile;
}
