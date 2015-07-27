# Advanced Aliases.
# Use with caution
#

#Karan Custom

my_sql() {
    mysql -ucloud -pscape -h${1-localhost} ${2-brint}
}

my_sqld() {
    mysqldump -ucloud -pscape -h${1-localhost} ${2-1} > ${2-1}.sql
}

my_uat() {
    ssh uat$1@192.168.4.100 
}

my_bb_uat() {
    
    ssh bbuser@192.168.4.1$1 
}

copy_uat_pwd(){
  csvtool col 3 ~/data/uat.csv | sed -n ${1}'p' | xclip -selection c
}

alias password="echo Jaimatadi7"
alias puat=copy_uat_pwd
alias gfo="git fetch origin"
alias gfk="git fetch karan-bb"
alias gsf="git submodule foreach"
alias gco="git checkout"
alias gsfgco="git submodule foreach git checkout"
alias gsfgfo="git submodule foreach git fetch origin"
alias gsfgfk="git submodule foreach git fetch karan-bb"
alias gp="git pull"
alias gsfgp="git submodule foreach git pull"
alias mvncci="mvn clean compile install -DskipTests"
alias brint="cd /opt/codebase/central-repo/"
alias bbapi="cd /opt/codebase/central-repo/services/bb-api"
alias core="cd /opt/codebase/central-repo/core-container"
alias csdb="cd /opt/codebase/central-repo/csdb-container"
alias cpdb="cd /opt/codebase/central-repo/cp-container"
alias cibil="cd /opt/codebase/central-repo/services/cibil"
alias expo="cd /opt/codebase/central-repo/services/exportservice"
alias msd="cd /opt/codebase/central-repo/md"
alias domain="cd /opt/codebase/central-repo/domain-container"
alias web="cd /opt/codebase/central-repo/websites"
alias sql=my_sql
alias sqld=my_sqld
alias uat=my_uat
alias bbuat=my_bb_uat
alias ibs="ibus-daemon -rd"
alias share="cd ~/share/; ifconfig; python -m SimpleHTTPServer"

alias gamma="ssh ckaran@10.3.211.1";password | xclip -selection c
alias beta="ssh ckaran@10.3.201.1";password | xclip -selection c
alias w1="ssh ckaran@10.3.1.101";password | xclip -selection c
alias w2="ssh ckaran@10.3.1.102";password | xclip -selection c
alias w3="ssh ckaran@10.3.1.103";password | xclip -selection c
alias w4="ssh ckaran@10.3.1.104";password | xclip -selection c
alias s1="ssh ckaran@10.3.2.1";password | xclip -selection c
alias s2="ssh ckaran@10.3.2.2";password | xclip -selection c
alias s3="ssh ckaran@10.3.2.3";password | xclip -selection c
alias s4="ssh ckaran@10.3.2.4";password | xclip -selection c
alias warehouse="ssh ckaran@10.3.2.101";password | xclip -selection c
# ls, the common ones I use a lot shortened for rapid fire usage
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'


alias zshrc='$EDITOR ~/.zshrc' # Quick access to the ~/.zshrc file
alias comalias='subl ~/.oh-my-zsh/plugins/common-aliases/common-aliases.plugin.zsh' # Quick access to the ~/.zshrc file

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'

# because typing 'cd' is A LOT of work!!
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias h='history'
alias hgrep="fc -El 0 | grep"
alias help='man'
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'

alias whereami=display_info

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# zsh is able to auto-do some kungfoo
# depends on the SUFFIX :)
if [ ${ZSH_VERSION//\./} -ge 420 ]; then
  # open browser on urls
  _browser_fts=(htm html de org net com at cx nl se dk dk php)
  for ft in $_browser_fts ; do alias -s $ft=$BROWSER ; done

  _editor_fts=(cpp cxx cc c hh h inl asc txt TXT tex)
  for ft in $_editor_fts ; do alias -s $ft=$EDITOR ; done

  _image_fts=(jpg jpeg png gif mng tiff tif xpm)
  for ft in $_image_fts ; do alias -s $ft=$XIVIEWER; done

  _media_fts=(ape avi flv mkv mov mp3 mpeg mpg ogg ogm rm wav webm)
  for ft in $_media_fts ; do alias -s $ft=mplayer ; done

  #read documents
  alias pdf=acroread
  alias -s ps=gv
  alias -s dvi=xdvi
  alias -s chm=xchm
  alias -s djvu=djview

  #list whats inside packed file
  alias -s zip="unzip -l"
  alias -s rar="unrar l"
  alias -s tar="tar tf"
  alias -s tar.gz="echo "
  alias -s ace="unace l"
fi

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

