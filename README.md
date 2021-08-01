# bind9-webmin-docker
This is based on https://github.com/isc-projects/bind9-docker but includes webmin web interface.  I also used https://github.com/fffaraz/docker-bind-webmin
to figure out how to start the webmin interface.  I then modified the CMD to invoke webmin in background and start named.

This is much simpler than fffaraz/docker-bind-webmin as it uses the bind9-docker as the basis and justs adds the webmin to it.
## Build the container
You can build the docker image in your local repo or use the one I have on hub.docker.com.

To build it yourself simply change your directory to the directory containing the Dockerfile where you clone this repo and issue this command:

```docker build -t "bind9:webmin" .```
This will create the bind9:webmin image in your repo.
## Create the container
Simply run the createDocker bash script in this GIT repo.
## Configuration
To be able to logon to the webadmin you need to reset the root password in your container.  You do not need to know what the original root password is. Here is a sample
session on how to do this:
```
docker exec -it bind9 bash
root@adab86c2f45d:/# passwd
New password:
Retype new password:
passwd: password updated successfully
root@adab86c2f45d:/# exit
exit
```
You will then be able to logon to the webmin ui using port 10000 on your docker host using userid root and the new password you have set.
