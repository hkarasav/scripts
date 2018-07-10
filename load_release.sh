#### This script is used to checkout all sub-projects to a specific ntas_release

set -e # When any of the next commands fail the shell script will exit immediately.
NTAS_RELEASE=$1
if [ $# != 1 ] ; then echo "ERROR in execution. Usage: ./load_release.sh <ntas_release e.g. ntas-18-0>"; exit 1 ; fi

checkout()
{
DIR=$1
git checkout ${NTAS_RELEASE}
git --git-dir "${DIR}/.git" --work-tree=${DIR} pull
echo $(tput setaf 2)DONE$(tput sgr0)
}

echo -e "\n$(tput setaf 3)/root/opentas update...for ${NTAS_RELEASE}$(tput sgr0)"
cd /root/opentas
checkout "/root/opentas"
git --git-dir "/root/opentas/.git" --work-tree="/root/opentas" submodule update --recursive

#echo -e "\n$(tput setaf 3)/root/opentas/moby/self-care update...for ${NTAS_RELEASE}$(tput sgr0)"
#cd /root/opentas/moby/self-care
#checkout "/root/opentas/moby/self-care"

echo -e "\n$(tput setaf 3)/root/opentas/ft update...for ${NTAS_RELEASE}$(tput sgr0)"
cd /root/opentas/ft
git checkout ${NTAS_RELEASE}
git --work-tree="/root/opentas/ft" pull
echo $(tput setaf 2)DONE$(tput sgr0)

echo -e "\n$(tput setaf 3)/root/opentas/kubernetes update...for ${NTAS_RELEASE}$(tput sgr0)"
cd /root/opentas/kubernetes
checkout "/root/opentas/kubernetes"

echo -e "\n$(tput setaf 3)/root/opentas/ft/vtas-testsuites update...for ${NTAS_RELEASE}$(tput sgr0)"
cd /root/opentas/ft/vtas-testsuites
checkout "/root/opentas/ft/vtas-testsuites"

echo -e "\n$(tput setaf 3)/root/opentas/ft/vtas-taf update...for ${NTAS_RELEASE}$(tput sgr0)"
cd /root/opentas/ft/vtas-taf
checkout "/root/opentas/ft/vtas-taf"

echo -e "\n$(tput setaf 3)/root/opentas/ft/single_vm_stuff update...for ${NTAS_RELEASE}$(tput sgr0)"
cd /root/opentas/ft/single_vm_stuff
checkout "/root/opentas/ft/single_vm_stuff"
