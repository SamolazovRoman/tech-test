The test: https://1drv.ms/b/s!AoDwBdlpg42dixByG555InRLrXEY

# Load Balancer + 2 application nodes Technical Test

Simplest instruction:

  - git clone this repository
  - In repository folder run: vagrant up (you should install vagrand and virtual box in advance)
  - After provisioning you will be able to open site on your HOST: localhost:8080 which will show you the message "Hi there, I'm served from app1", update the page and message will ganged to "Hi there, I'm served from app2"
  - When you make shure that application works - retorn to terminal and type: vagrant destroy

### Description:
This repositore stores Vagrant file and Ansible playbook.
The vagrant file will run 4 VM: web, app1, app2, ansible.
The mashines has no configurations (except ansible it will be configured by shell script while provision).
Also Vagrant will redirect port 8080 from host to port 80 on web VM, this redirection allow us do not login to machine check how Ngnx works.
### Vagrant provision script:
This script do siple work:
 - Install software: ansible sshpass
 - Create inventory file (long story but it because I did this task from windows machine)
 - Add VMs: web, aap1, app2 to known host for ssh connections
 - Run ansible playbook: nginx.yml

**Manual running:**  
If vagrand up don't works - something went wrong, in most cases this issues related to networking, to avoid this situation in Vagrant described two networks (one of them DHCP, other in static).
However, if the vegarnt file doesn't work - run play book manually:
1) copy content of the res/ folder on ansible node
2) Make sure you've installed software: ansible sshpass
3) Ifinventory file not exist - create it in fallowing format:
[webservers]
192.168.10.10 ansible_user=vagrant ansible_ssh_pass=vagrant
[appservers]
192.168.10.21 ansible_user=vagrant ansible_ssh_pass=vagrant
192.168.10.22 ansible_user=vagrant ansible_ssh_pass=vagrant
4) Check the connection, run the command: ansible -i host all -m ping
5) When everything green - run the command: ansible-playbook -i host nginx.yml

### Helpful links:
Vagrant: https://www.vagrantup.com/

> the Task was done on windows mashine which add extra complexcity with permissions, line ending etc.

### Version
1.0.0
