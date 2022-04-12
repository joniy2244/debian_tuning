# Сохранять историю консоли
shopt -s histappend
PROMPT_COMMAND='history -a'

# Ошибки в написании (например, ect вместо etc) будут исправляться.
shopt -s cdspell

# Указываем терминалу исправлять мелкие ошибки в написании имен директорий, при автодополнении.
shopt -s dirspell

# В .bashrc, и многострочные команды будут записываться в одну строку
shopt -s cmdhist

# Осуществляет возврат к последней посещенной директории — когда нужно перейти куда-то чтобы что-то изменить, а затем быстро вернуться назад. Команда: cd -
history | grep "foo"

# Увеличиваем размер истории команд терминала
HISTSIZE=10000

# Не вносил в историю копии команд
export HISTCONTROL=ignoredups

# Просматривать историю, нажимая стрелками влево или вправо
bind '"e[A": history-search-backward'
bind '"e[B": history-search-forward'

### Раскрашиваем консоль ###
# Изменение цвета курсора и подсказок
cursor_color='#0087FF'
prompt_color='33'

# Добавить красный
cursor_color='#FF0000'
prompt_color='196'

# Добавление цветов
git config --global color.ui true
alias ll='ls -lah --color=auto'
alias dmesg='dmesg --color=always'
alias grep='grep --color=always'
alias fgrep='fgrep --color=always'
alias egrep='egrep --color=always'
alias gcc='gcc -fdiagnostics-color=always'
alias pacman='pacman --color=always'

# Раскрашиваем man
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# Развёрнутый синтаксис
set_prompt () {
    Last_Command=$? # Must come first!
    Blue='\[\e[01;34m\]'
    White='\[\e[01;37m\]'
    Red='\[\e[01;31m\]'
    Green='\[\e[01;32m\]'
    Reset='\[\e[00m\]'
    FancyX='\342\234\227'
    Checkmark='\342\234\223'

    # Add a bright white exit status for the last command
    PS1="$White\$? "
    # If it was successful, print a green check mark. Otherwise, print
    # a red X.
    if [[ $Last_Command == 0 ]]; then
        PS1+="$Green$Checkmark "
    else
        PS1+="$Red$FancyX "
    fi
    # If root, just print the host in red. Otherwise, print the current user
    # and host in green.
    if [[ $EUID == 0 ]]; then
        PS1+="$Red\\h "
    else
        PS1+="$Green\\u@\\h "
    fi
    # Print the working directory and prompt marker in blue, and reset
    # the text color to the default.
    PS1+="$Blue\\w \\\$$Reset "
}
PROMPT_COMMAND='set_prompt'
