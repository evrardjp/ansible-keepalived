lxc-stop -n container1
lxc-stop -n container2
lxc-destroy -n container1
lxc-destroy -n container2
lxc-ls -f
ip link set down dev br-mgmt
brctl delbr br-mgmt
