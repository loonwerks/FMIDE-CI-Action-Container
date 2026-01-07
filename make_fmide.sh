#! /bin/bash

set -Eeuxo pipefail

: "${FMIDE_DIR:=fmide}"
: "${eclipseRelease:=2023-12}"
: "${OSATE_VERSION:=2.14.0-vfinal}"
: "${OSATE_URL:=https://osate-build.sei.cmu.edu/download/osate/stable/${OSATE_VERSION}/products/osate2-${OSATE_VERSION}-linux.gtk.x86_64.tar.gz}"
: "${RESOLUTE_UPDATE_SITE:=https://raw.githubusercontent.com/loonwerks/Resolute-Updates/master/}"
: "${RESOLUTE_FEATURE_ID:=com.rockwellcollins.atc.resolute.feature.feature.group}"
: "${RESOLUTE_VERSION:=4.1.201}"
: "${AGREE_UPDATE_SITE:=https://raw.githubusercontent.com/loonwerks/AGREE-Updates/master/}"
: "${AGREE_FEATURE_ID:=com.rockwellcollins.atc.agree.feature.feature.group}"
: "${AGREE_VERSION:=2.12.0}"
: "${BRIEFCASE_UPDATE_SITE:=https://raw.githubusercontent.com/loonwerks/Briefcase-Updates/master/}"
: "${BRIEFCASE_FEATURE_ID:=com.collins.trustedsystems.briefcase.feature.feature.group}"
: "${BRIEFCASE_VERSION:=0.9.2}"

rm -rf ${FMIDE_DIR}
mkdir -p ${FMIDE_DIR}
pushd ${FMIDE_DIR}
curl ${OSATE_URL} | tar xz
popd

${FMIDE_DIR}/osate -nosplash -console -consoleLog -application org.eclipse.equinox.p2.director -repository ${RESOLUTE_UPDATE_SITE} -installIU ${RESOLUTE_FEATURE_ID}/${RESOLUTE_VERSION}
${FMIDE_DIR}/osate -nosplash -console -consoleLog -application org.eclipse.equinox.p2.director -repository ${AGREE_UPDATE_SITE} -installIU ${AGREE_FEATURE_ID}/${AGREE_VERSION}
${FMIDE_DIR}/osate -nosplash -console -consoleLog -application org.eclipse.equinox.p2.director -repository ${BRIEFCASE_UPDATE_SITE} -installIU ${BRIEFCASE_FEATURE_ID}/${BRIEFCASE_VERSION}
