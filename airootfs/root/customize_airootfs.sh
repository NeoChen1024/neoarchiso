w
#!/bin/bash

set -e -u

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/UTC /etc/localtime

usermod -s /usr/bin/zsh root
cp -aT /etc/skel/ /root/
chmod 700 /root

sed -i 's/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf

sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf

systemctl enable pacman-init.service choose-mirror.service
systemctl set-default multi-user.target

# Speed up X session startup
fc-list > /dev/null 2>&1

touch ~/.rasi

(
	git clone https://gitlab.com/Neo_Chen/neozshrc
	cd neozshrc
	yes y | ./install
	cd ..
	rm -rf neozshrc
)
(
	cd /root
	mkdir vcs
	cd vcs
	git clone https://github.com/zdharma/fast-syntax-highlighting.git
	git clone https://github.com/psprint/zsh-navigation-tools.git
)

sed -i '/\[neo_chen\]/,$d' /etc/pacman.conf
