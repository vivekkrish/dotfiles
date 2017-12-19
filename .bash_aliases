# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    #eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='ls --color=auto --format=vertical'
    alias vdir='ls --color=auto --format=long'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias d='ls -d */'
alias sl='ls'	# typo!

# use updated tar
#alias tar='/usr/local/packages/tar-1.26/bin/tar'

# Misc aliases
alias ..='cd ..'
alias cls='clear; ls -lh'
alias remove='rm -rfv'
alias hist='history | less'
alias vless='vim -u /usr/share/vim/vim70/macros/less.vim'
alias les='less'    # typo!
alias lses='less'    # typo!
alias calc='bc'
alias list='~/bin/list'
alias grep='grep --color=auto'
alias vim='vim -p'
alias vi='vim -p'
alias topv='top -c -u vkrishna'
alias exot='exit'   # typo!
alias xit='exit'   # typo!
alias mkexec='chmod +x *.pl *.py *.sh'
alias py='python'
alias gitpull='/home/vkrishna/.cronjob/git.pull.sh >> /home/vkrishna/.cronjob/tanghaibao_jcvi_git.pull.log 2>&1'
alias gitlog='cd /home/vkrishna/git/jcvi; git log; cd -'
alias asndisc='linux64.asndisc'
alias today='echo `date +"%Y%m%d"`'
alias now='echo `date +"%Y%m%d_%H%M"`'
alias bedsort='sort -k1,1 -k2,2g'
alias ncpu='grep -c ^processor /proc/cpuinfo'
alias qj='qjobstats -usage -timeline -owner vkrishna > results.html'
alias ro='chmod ugo+r-wx'
#alias easy_install='easy_install -UZ --prefix=/home/vkrishna'
#alias easy_uninstall='easy_install -mxN'
#
# job handling
alias bd='bg && disown'

# Aliases to most frequently used folders
alias mtg3='cd /usr/local/projects/MTG3'
alias mt35='cd /usr/local/projects/MTG3/IMGAG3.5'
alias mips='cd /usr/local/projects/MTG3/IMGAG3.5/FROM_MIPS'
alias mtg4='cd /usr/local/projects/MTG4/A17'
alias pseudos='cd /usr/local/projects/MTG3/IMGAG3.5/PSEUDOMOLECULE_BUILD/CURRENT/'
alias scratch='cd /usr/local/scratch/EUK/vkrishna'
alias archive='cd /usr/local/archive/projects/MTG3'

# GFF specific aliases
alias grepm='grep -P "\s+mRNA\s+\d+\s+\d+\s+"'
alias grepg='grep -P "\s+gene\s+\d+\s+\d+\s+"'

# usepackage derived aliases
alias prmenu='source /usr/local/common/prmenu/prmenu.sh'
alias print='enscript -1R -h'
alias rprint='enscript -r -fCourier6'
alias lpr='lpr -h'
alias lpr2='lpr -o sides=two-sided-long-edge'
alias manpr='troff -t -man $* | lpr -t -'
alias smlpr='enscript -fCourier8'
alias tpr='tbl $* | troff -t -ms | lp -Ttroff'
alias pwd='echo $PWD'
alias lock='xscreensaver-command -lock'
alias glock='gnome-screensaver-command --lock'
alias klock='kdesktop_lock'
alias df='df -k'
alias sybprod='declare -x DSQUERY=SYBPROD'

# Python aliases (Haibao's code base)
alias fasta='python -m jcvi.formats.fasta'
alias fastq='python -m jcvi.formats.fastq'
alias blast='python -m jcvi.formats.blast'
alias agp='python -m jcvi.formats.agp'
alias gff='python -m jcvi.formats.gff'
alias bed='python -m jcvi.formats.bed'
alias entrez='python -m jcvi.apps.entrez'
alias grid='python -m jcvi.apps.grid'
alias join='python -m jcvi.formats.base join'
alias setop='python -m jcvi.formats.base setop'
alias flatten='python -m jcvi.formats.base flatten'
alias waitpid='python -m jcvi.apps.base waitpid --interval=10'

# grid aliases
alias qsub="qsub -P ${PCODE}"
alias qsubn="qsub -m aes -M ${EMAIL}"
alias qlogin="qlogin -P ${PCODE}"
alias qaltern="qalter -m aes -M ${EMAIL}"
alias sge_hold_jid="${HOME}/bin/sge_hold_jid && source ${HOME}/tmp/.sge_hold_jid"

# Server login aliases
alias biocon='ssh -XYC biocon.berkeley.edu -l bao'
alias spike='ssh spike.jcvi.org'
alias lserver="ssh lserver1.jcvi.org"

# reset `which` alias
#alias which='/usr/bin/which'

# misc aliases
alias add='paste -sd+ - | bc'
alias gtgff3='gt gff3 -sort -tidy -retainids -checkids yes -addids no'
