alias fullhostname='ping -a localhost'

alias gst='git status'

alias gco='git checkout'

alias gp='git pull'

alias start-client-dev='gulp serve --mantle=http://dev-service-address.ie'

alias start-client-local='gulp serve --mantle=http://localhost'


alias find-in-files='grep -rnw . -e '

alias ssh-qa='ssh admin@qa-server.ie'

alias ssh-dev='ssh ubuntu@dev-server.ie'

alias sshProdServiceBox='ssh-PROD-aws-box 10.128.21.175'


alias dbPing="echo 'ping server-address.ie'"

ssh-qa-aws-box() {

    ssh -i /c/Keys/ecs-linux-qa.pem ubuntu@"$1"

}
ssh-dev-aws-box() {

    ssh -i /c/Keys/ecs-linux-dev.pem ubuntu@"$1"

}
ssh-PROD-aws-box() {

    ssh -i /c/Keys/ecs-linux.pem ubuntu@"$1"

}

gcm() {
    git commit -m "$1"
}
