# Some Ansible scripts

## File structure



    .
    ├── etc                      
    │   ├── hosts                           # inventory file
    │   ├── ansible.cfg                     # Ansible configuration file   
    ├── .ssh                                # create folder and put private key here if shh-keys are used
    ├── playbooks                           # all playbooks
    │   ├── play-provision-systems.yml      # playbook to provision new systems
    │   ├── play-install-systems.yml        # playbook to install monitoring and jenkins worker
    ├── roles                               # all roles that are used in the playbooks
    │   ├── galaxy                          # external roles from Ansible Galaxy as git modules
    │   ├── monitoring                      # roles related to monitoring
    │   ├── ping-all                        # debug role that just pings a target
    │   └── provisioning                    # roles related to provisioning of a target
    ├── docker-compose.yaml                 # describes how Ansible can be run locally
    └── Dockerfile                          # builds Ansible docker image for running scripts even from windows


# Manual run and provisioning of new systems

## Prerequisits:
- Installed Docker & Docker-Compose on Windows or Linux
- Cloned repository

## Usage

Run:
``` 
docker-compose run ansible
```
(This command also builds the container if it isn't available yet. So the first run may take a while.)

Then you are in a Liunx CMD within the docker container:
```
ansible-playbook [playbook] -u [User] -kK
```
- `-u` > run as another user
- `-k` > ask for user password
- `-K` > ask for sudo password


## Provisioning
To add the new machine to the inventory file at **etc/host** and then run the provisioning playbook `play-provision-systems.yml` with the following command: You need a user account with sudo and the password for this. 

```
ansible-playbook play-provision-systems -u (user) -kK
```
This adds the ansible user, that is later used by Jenkins to configure the systems.


## Ressources:

- Create encrypted passwort for user
```
ansible all -i localhost, -m debug -a "msg={{ 'mypassword' | password_hash('sha512', 'mysecretsalt') }}"
```
Replace 'mypassword' and 'mysecretsalt' accordingly.


- Create SSH key for user

```
ssh-keygen -t ed25519 -C "[mail]"
```