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
alias ls='ls --color=auto'
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



