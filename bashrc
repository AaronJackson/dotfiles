# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PATH=$PATH:$HOME/usr/bin:/usr/local/bin
MAILPATH=$(find ~/Maildir/ -name "new" -type d | tr '\n' ':' )
export MAILPATH=${MAILPATH::-1}
export MAILCHECK=3
export MAIL_DIR=~/Maildir/personal/INBOX/
export EDITOR="emacsclient -nw"
export VISUAL="emacsclient -nw"
export EMAIL="aaron@aaronsplace.co.uk"
export NAME="Aaron S. Jackson"

export PYTHONSTARTUP=~/.pythonrc

function g () {
    # this function overloads the SSH_AUTH_SOCK, setting it to use
    # gpg-agent rather than the default ssh-agent.
    SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket) $@
}

# XFCE starts an ssh-agent automatically, with its address in /tmp,
# but for some reason this prevents PIV PKCS11 plugins from being
# loaded.
[ ! -S $HOME/.ssh/ssh-agent ] && eval $(ssh-agent -a $HOME/.ssh/ssh-agent)
export SSH_AUTH_SOCK=$HOME/.ssh/ssh-agent

function piv () {
    ssh-add -e /usr/lib64/libykcs11.so 2> /dev/null
    ssh-add -s /usr/lib64/libykcs11.so
}

gpgconf --launch gpg-agent


function logweight () {
    echo $(date +%Y-%m-%d),$1 >> weight.csv
}


function oath () {
    ykman oath accounts code $1
}


alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

function uodvpn () {
    # I know, this is disgusting, but Connect Tunnel won't open my
    # browser for it? So, I grep out the link and then click it...
    DISPLAY= sudo strace -f -s 4096 startct 2> \
	   >(grep execve | grep dundee)
}
