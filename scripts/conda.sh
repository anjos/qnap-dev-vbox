#!/bin/bash

MINICONDA=/tmp/miniconda.sh
ARCH="Linux-x86"

if [ ! -x ${MINICONDA} ]; then
  mkdir -pv `dirname ${MINICONDA}`
  echo "[>>] Downloading `basename ${MINICONDA}` -> ${MINICONDA}..."
  curl https://repo.continuum.io/miniconda/Miniconda3-latest-${ARCH}.sh --output ${MINICONDA}
  chmod 755 ${MINICONDA}
fi

mount -a #make sure the bind mounts are there
/usr/sbin/chroot /opt/cross-project/x86/sys-root /bin/bash -x <<'EOF'

BASEDIR=/opt/conda
CONDA=${BASEDIR}/bin/conda
MINICONDA=/tmp/miniconda.sh

dhclient eth0

# Create root environment and add basic channels for conda
if [ ! -e ${CONDA} ]; then
  echo "[>>] Creating root environment and setting basic options..."
  bash ${MINICONDA} -b -p ${BASEDIR}
fi

if [ ! -e ${HOME}/.condarc ]; then
  touch ${HOME}/.condarc
  ${CONDA} config --set show_channel_urls True
  ${CONDA} config --add channels anjos
  ${CONDA} config --add channels defaults
fi

echo "[>>] Updating conda in the root environment..."
${CONDA} update --yes -n root conda
${CONDA} install --yes -n root conda-build anaconda-client

${CONDA} clean --all --yes

echo -e "\n# Added by packer" >> /etc/bash.bashrc
echo "export PATH=/opt/conda/bin:${PATH}" >> /etc/bash.bashrc
EOF

echo "[>>] Cleaning-up..."
rm -f ${MINICONDA}
