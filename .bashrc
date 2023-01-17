# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=


# User specific aliases and functions
################################################################################
#                                Settings                                      #
################################################################################
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\e[0;1;95m\]\W\[\033[33m\]\$(parse_git_branch)\[\e[0;1;94m\] $\[\e[0m\] "
set -o emacs

xset r rate 300 50
setxkbmap -layout fr -option ctrl:nocaps

################################################################################
#                                Fonctions                                     #
################################################################################
compile_clang() {
	execFileName=$(echo "$1" | sed 's/.c//g')
	flags=""

	# test if math.h is included:
	if [ ! -z "$(grep "<math.h>" $1)" ]
	then
		flags="-lm"
	fi

	# TODO: test if SDL/SDL.h or SDL/SDL2.h are included

	# compile command:
	gcc -Wall -Wextra -o $execFileName $1 $flags
}

compile() {
	case $1 in
		*.c)
			compile_clang $1
			;;
		*)
			echo "unknown file type :("
			;;
	esac
}


# simplify the `find` command
search() {
    find $1 -name $2 -print 2> /dev/null
}

# extract file
extr() {
    case $1 in
        *.zip) unzip $1 ;;
        *.tar.gz) tar -xvzf $1 ;;
        *.tar) tar -xvf $1 ;;
        *) echo "ERROR: unknown format"
    esac
}

# compile
comp() {
  case $1 in
    *.tex) pdflatex $1 ;;
    *.md) pandoc -o $(echo $1 | sed 's/\.md/\.pdf') $1 ;;
    *.java) javac $1 ;;
    *.c) gcc -Wall -Wextra -Wuninitialized -o prog $1 ;;
    *.hs) ghc -dynamic $1 ;;
    *.py) python3 $1 ;;
    *) echo "ERROR: unknown format"
  esac
}

# open a file using the right program
view() {
    case $1 in
        *.jpg|*.png|*.jpeg) nsxiv $1 & ;;
        *.pdf) zathura $1 ;;
        *.csv|*.docx) libreoffice $1 & ;;
        *) echo "ERROR: unknown format"
    esac
}

# search a process pid
pss() {
    procs=$(ps aux)
    echo $procs | grep $1 | awk '{ $3=$4=$5=$6=$7=$8=$9=$10="" }1' | column -t -N "OWNER,PID,NAME"
}

# ls search
lss() {
    ls | grep $1
}

# decript a file using gpg
decrypt() {
    gpg -d $1 > $(echo $1 | sed 's/.gpg//')
}

# yank last command
yyc() {
    fc -ln -1 | xclip -i -selection clipboard
}

# increase input capture and change capslock to ctrl
key() {
    xset r rate 300 50
    setxkbmap -layout fr -option ctrl:nocaps
}

# open file in emacs client
eedit() {
    emacsclient -e "(find-file \"$1\")"
}

# eedit using fzf (working in emacs term if emacs server is on)
fzf-eedit() {
    eedit $(fzf)
}

# inverted remove
rrm() {
  saved_files="$1" # TODO: find a way to treat $1 one time

  for e in $@; do
    saved_files=$(echo "$saved_files|$e")
  done

  for r in $(ls | grep -E $saved_files -v); do
    rm -rf $r
  done
}

# git track remote branche
grb() {
  git branch --track $1 origin/$2
}

# add to git ignore (must be at the root of the project)
gi() {
  for f in $@; do
    echo $f >> .gitignore
  done
}


################################################################################
#                                  Alias                                       #
################################################################################
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias e='vim'
alias vs='vim $HOME/shared/.bashrc'
alias vc='vim $HOME/.vimrc'
alias srcbash='source $HOME/.bashrc'

alias ccc='gcc -Wall -Wextra -o'
alias gitlogpretty='git log --graph --pretty="%C(yellow) Hash: %h %C(blue)Date: %ad %C(red) Message: %s " --date=human'
alias gitlogprettysoprettynotliketheo='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

################################################################################
#                                   git                                        #
################################################################################
alias g='git'
alias gS='git status'
alias ga='git add -A'
alias gc='git commit -m '
alias gca='git commit --amend -m '
alias gm='git merge '
alias gb='git branch '
alias gba='git branch -a'
alias gck='git checkout '

# git new branch
gnb() {
  if [ $# -eq 1 ]; then
    # track remote branch if exists
    if [ ! -z $(git branch -r | grep $1) ]; then
      echo "git branch --track $1 origin/$1"
      git branch --track $1 origin/$1
    else
      echo "git branch $1"
      git branch $1
    fi
  else
    echo "ERROR: branch name required"
  fi
}

ghelp() {
  echo "g   --> git"
  echo "gS  --> git status"
  echo "ga  --> git add -A"
  echo "gc  --> git commit -m "
  echo "gca --> git commit --amend -m "
  echo "gm  --> git merge "
  echo "gb  --> git branch "
  echo "gba --> git branch -a"
  echo "gck --> git checkout "
  echo "gnb --> git branch [branch | --track branch origin/branch]"
}
