# Tunning system
cp tunning/limits.lxd.conf /etc/security/limits.d/lxd.conf
cp tunning/sysctl.lxd.conf /etc/sysctl.d/20-lxd.conf

sysctl --system

