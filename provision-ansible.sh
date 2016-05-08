apt-get -y install ansible sshpass
cp -r /vagrant/res/. /home/vagrant/
printf '[webservers]\n192.168.10.10 ansible_user=vagrant ansible_ssh_pass=vagrant\n[appservers]\n192.168.10.21 ansible_user=vagrant ansible_ssh_pass=vagrant\n192.168.10.22 ansible_user=vagrant ansible_ssh_pass=vagrant' > /home/vagrant/host
sshpass -p vagrant ssh -o StrictHostKeyChecking=no vagrant@192.168.10.10 exit && sshpass -p vagrant ssh -o StrictHostKeyChecking=no vagrant@192.168.10.21 exit && sshpass -p vagrant ssh -o StrictHostKeyChecking=no vagrant@192.168.10.22 exit &
ansible-playbook -i /home/vagrant/host /home/vagrant/nginx.yml