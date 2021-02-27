# homeserver_ansible
Ansible playbook to bootstrap my [homeserver](https://github.com/Kwbmm/Homeserver)

# Running the playbook

## Install `passlib`
The playbook asks for a new password for default user. Thus, `passlib` python library needs to be installed. It's better to make a virtual environment to not pollute the host system, so run:

```sh
python3 -m venv .env && \
source .env/bin/activate && \
pip install -r requirements.txt
```

to create the virtual environment, load (source) it and install `passlib`

## <a href="run"></a>Run

The playbook can be run with `ansible-playbook bootstrap.yml -K`. The `host` in `bootstrap.yml' should be set to `rpi`

# Test

Testing is done through a debian docker image, built through the `Dockerfile`. To build the image:

```sh
docker build -t debian_ssh .
```

The image exposes an SSH server to which you can connect to.

Once the build is complete, you can run the container with:

```sh
docker run -p 22:22 -d debian_ssh
```

## SSH Connection Setup

You will need to copy the ansible ssh key:

```sh
scp ~/.ssh/id_homeserver_ansible_login.pub test@172.17.0.2:~/.ssh/authrozied_keys
```

The password for `test` user is `test`.

If the ssh connection has been configure correctly, you'll be able to connect to the container through ssh with a simple:

```sh
ssh -i ~/.ssh/id_homeserver_ansible_login test@172.17.0.2
```

(IP address may vary)

The `host` in `bootstrap.yml` should be set to `test`.

Refer to [Run](#run) section for launching the playbook.