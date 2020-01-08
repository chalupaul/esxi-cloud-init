#!/usr/bin/env bash


DO_INSTALL=false
if [ -f /home/vagrant/.pyenv/bin/pyenv ]; then
    echo "pyenv already installed"
else
    curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
    DO_INSTALL=true
fi


command -v pyenv || cat << EOF >> /home/vagrant/.bashrc
export PATH="/home/vagrant/.pyenv/bin:$PATH"
eval "\$(pyenv init -)"
eval "\$(pyenv virtualenv-init -)"
EOF

. /home/vagrant/.bashrc


if [ $DO_INSTALL ]; then
    pyenv install 3.5.7
    pyenv global 3.5.7
    pip install --upgrade pip
    pip install poetry
    curl -O https://download3.vmware.com/software/vmw-tools/vibauthor/vmware-esx-vib-author-5.0.0-0.0.847598.i386.rpm
    sudo yum install -y vmware-esx-vib-author-5.0.0-0.0.847598.i386.rpm
fi
