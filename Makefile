.PHONY: build run ansible

build:
	sudo docker build -t debian_ssh .

run:
	-sudo docker rm -f test_container
	sudo docker run -p 22:22 --name test_container -d debian_ssh
	scp ~/.ssh/id_homeserver_ansible_login.pub test@172.17.0.2:~/.ssh/authorized_keys

ansible: build run
	ansible-playbook bootstrap.yml -K