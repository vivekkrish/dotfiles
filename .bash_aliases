# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
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

# Misc aliases
alias ..='cd ..'
alias cls='clear; ls -lh'
alias remove='rm -rfv'
alias hist='history | less'
alias vless='vim -u /usr/share/vim/vim70/macros/less.vim'
alias les='less'    # typo!
alias calc='bc'
alias list='~/bin/list'
alias grep='grep --color=auto'
alias vim='vim -p'
alias vi='vim -p'
alias topv='top -c -u vkrishna'
alias exot='exit'   # typo!
alias mkexec='chmod +x *.pl *.py *.sh'
alias igv='java -Xmx1500m  -jar /local/devel/ANNOTATION/vkrishna/IGV_1.5.53/igv.jar'
alias py='python'

# Aliases to most frequently used folders
alias mtg3='cd /usr/local/projects/MTG3'
alias mt35='cd /usr/local/projects/MTG3/IMGAG3.5'
alias mips='cd /usr/local/projects/MTG3/IMGAG3.5/FROM_MIPS'
alias mtg4='cd /usr/local/projects/MTG4/A17'
alias pseudos='cd /usr/local/projects/MTG3/IMGAG3.5/PSEUDOMOLECULE_BUILD/CURRENT/'
alias scratch='cd /usr/local/scratch/vkrishna'
alias archive='cd /usr/local/archive/projects/MTG3'

# usepackage derived aliases
alias prmenu='source /usr/local/common/prmenu/prmenu.sh'
alias print='enscript -2r -h'
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
alias agp='python -m jcvi.formats.agp'
alias entrez='python -m jcvi.apps.entrez'
alias grid='python -m jcvi.apps.grid'

# Server login aliases
alias spike='ssh spike.jcvi.org'
alias lserver="ssh lserver1.jcvi.org"
