#!/usr/bin/env bash

curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash


cat << EOF >> ${HOME}/.bashrc
export PATH="${HOME}/.pyenv/bin:$PATH"
eval "\$(pyenv init -)"
eval "\$(pyenv virtualenv-init -)"
EOF

. ${HOME}/.bashrc


pyenv install 3.5.7
export PYENV_VERSION=3.5.7
pip install --upgrade pip
pip install poetry
curl -O https://download3.vmware.com/software/vmw-tools/vibauthor/vmware-esx-vib-author-5.0.0-0.0.847598.i386.rpm
sudo yum install -y vmware-esx-vib-author-5.0.0-0.0.847598.i386.rpm
pyenv virtualenv esxicloudinit
pyenv activate esxicloudinit
pip install -r src/cloud-init/requirements.txt

cd ${HOME}/src
git clone https://github.com/cloud-init/cloud-init.git

cd ${HOME}/src/cloud-init
python setup.py clean
python setup.py build
python setup.py install --root ${HOME}/dist/cloud-init/payloads/cloud-init --install-scripts usr/bin --install-lib usr/lib/python3.5/site-packages
cp /home/vagrant/src/descriptor.xml ${HOME}/dist/cloud-init

cd ${HOME}/dist
pyenv install 2.6.9
export PYENV_VERSION=2.6.9
pyenv versions
pip install lxml==2.2.8
export PYCURL_SSL_LIBRARY=nss
pip install --compile --install-option="--with-nss" --no-cache-dir pycurl
pip install urlgrabber
vibauthor -C -t cloud-init -v cloud-init.vib -O cloud-init.zip
