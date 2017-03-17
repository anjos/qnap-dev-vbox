#!/bin/bash
BASEDIR=/opt/conda
CONDA=${BASEDIR}/bin/conda
MINICONDA=/tmp/miniconda.sh
PYTHON_VERSION=3.5
ARCH="Linux-x86"

if [ ! -x ${MINICONDA} ]; then
  mkdir -pv `dirname ${MINICONDA}`
  echo "[>>] Downloading `basename ${MINICONDA}` -> ${MINICONDA}..."
  curl https://repo.continuum.io/miniconda/Miniconda3-latest-${ARCH}.sh --output ${MINICONDA}
  chmod 755 ${MINICONDA}
fi

# Create root environment and add basic channels for conda
if [ ! -x ${CONDA} ]; then
  echo "[>>] Creating root environment and setting basic options..."
  bash ${MINICONDA} -b -p ${BASEDIR}
  ${CONDA} config --set show_channel_urls True
  ${CONDA} config --add channels anjos
  ${CONDA} config --add channels defaults
fi

echo "[>>] Updating conda in the root environment..."
${CONDA} update --yes -n root conda

echo "[>>] Cleaning-up..."
rm -f ${MINICONDA}
${CONDA} clean --all --yes
