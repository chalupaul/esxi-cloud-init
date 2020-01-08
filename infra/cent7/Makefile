CURRENT_DIR := $(shell pwd)

.PHONY: clean

help:
	@echo "Run make with:"
	@echo " > validate       ...to run packer validation"
	@echo " > build          ...to start packer build"
	@echo " > up             ...to start vagrant"
	@echo " > reload         ...to reload vagrant"
	@echo " > ssh            ...to ssh into vm"
	@echo " > clean          ...to cleanup for next build"

build:
	packer build $(CURRENT_DIR)/packer.json
	cp $(CURRENT_DIR)/src/Vagrantfile.tpl $(CURRENT_DIR)/target/Vagrantfile

validate:
	packer validate $(CURRENT_DIR)/packer.json

spinup:
	vagrant box add packer/centos7 $(CURRENT_DIR)/target/CentOS-7.box --force
	cd $(CURRENT_DIR)/target && vagrant up

spindown:
	cd $(CURRENT_DIR)/target && vagrant halt

vib: build spinup spindown

reload:
	cp $(CURRENT_DIR)/src/Vagrantfile.tpl $(CURRENT_DIR)/target/Vagrantfile
	cd $(CURRENT_DIR)/target && vagrant reload

ssh:
	cd $(CURRENT_DIR)/target && vagrant ssh

clean:
	cd $(CURRENT_DIR)/target && vagrant halt
	cd $(CURRENT_DIR)/target && vagrant destroy -f 2> /dev/null
	vagrant box remove packer/centos7
	rm -fr $(CURRENT_DIR)/builds/
	rm -fr $(CURRENT_DIR)/target 2> /dev/null

all: build up ssh
