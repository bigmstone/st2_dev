install_deps () {
    apt-get update
    apt-get -y install make python-pip libffi-dev mongodb postgresql libssl-dev \
        rabbitmq-server python-dev python-setuptools libxslt1-dev libxml2-dev \
        libyaml-dev
    pip install --upgrade pip
    pip install virtualenv
    pip install tox
}

install_mistral () {
    mkdir /etc/mistral
    cat << EOF >/etc/mistral/mistral.conf
[database]
connection=mysql://mistral:StackStorm@localhost/mistral
max_pool_size=50
[pecan]
auth_enable=false
EOF
}

main () {
    install_deps
    install_mistral
}

main
