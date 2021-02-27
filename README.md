# homeserver_ansible
Ansible playbook to bootstrap my [homeserver](https://github.com/Kwbmm/Homeserver)


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