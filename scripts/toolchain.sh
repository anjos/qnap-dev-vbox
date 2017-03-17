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
