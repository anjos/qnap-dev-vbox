#!/bin/bash

URL=https://sourceforge.net/projects/qosgpl/files/QNAP%20NAS%20Tool%20Chains/cross-project-x86.u7-20111011.tar.gz
FNAME=/tmp/`basename ${URL}`

echo "[>>] Downloading toolchain \`${FNAME}\' from sourceforge..."
curl -L ${URL} > /${FNAME}
cd /
echo "[>>] Extracting toolchain \`${FNAME}\' from tarball..."
tar xfz ${FNAME}
echo "[>>] Removing tarball \`${FNAME}\'..."
rm -f ${FNAME}

echo "[>>] Preparing environment..."
CHROOT=/opt/cross-project/x86/sys-root
mkdir -pv ${CHROOT}/dev
echo "/dev ${CHROOT}/dev none defaults,bind 0 0" >> /etc/fstab
mkdir -pv ${CHROOT}/sys
echo "/sys ${CHROOT}/sys none defaults,bind 0 0" >> /etc/fstab
mkdir -pv ${CHROOT}/proc
echo "/proc ${CHROOT}/proc none defaults,bind 0 0" >> /etc/fstab
mkdir -pv ${CHROOT}/tmp
echo "/tmp ${CHROOT}/tmp none defaults,bind 0 0" >> /etc/fstab
mkdir -pv ${CHROOT}/root
echo "/root ${CHROOT}/root none defaults,bind 0 0" >> /etc/fstab
echo "/etc/resolv.conf ${CHROOT}/etc/resolv.conf none defaults,bind 0 0" >> /etc/fstab
