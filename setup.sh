mkdir -p ~/.scripts/
cp * ~/.scripts/
ln -s ~/.scripts/kube_exec.sh /usr/local/bin/kube_exec
echo "kube_exec added"
ln -s ~/.scripts/tmuxcopy.sh /usr/local/bin/tmuxcopy
echo "tmuxcopy added"

