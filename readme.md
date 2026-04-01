配置ansible服务器
1.安装最小版操作系统

2. yum install ansible -y
3. 修改/etc/ansible/ansible.cfg里面的配置文件，将host_key_checking = False
4. 修改/etc/ansible/hosts文件，添加新节点
   [controller]
   IP
   [compute]
   IP
5.建立各节点互信 ssh-keygen
6 拷贝ssh-copy-id -i ~/.ssh/id_rsa.pub root@IP

配置openstack 集群
1.修改hosts里面的配置参数IP地址,修改/etc/ansible/hosts文件参数
2.更改roles下group_vars/all.yml里面的参数
3.安装控制节点，修改install_openstack_controller.yml里面的roles，执行ansible-playbook -i ./hosts install_openstack_controller.yml
4.安装计算节点，修改install_openstack_compute.yml里面的roles,执行ansible-playbook -i ./hosts install_openstack_compute.yml

更改virt_type
crudini -set /etc/nova/nova.conf libvirt virt_type qemu
systemctl restart libvirtd.service openstack-nova-compute.service
