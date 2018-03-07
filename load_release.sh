#### This script is used to checkout all sub-projects to a specific release

set -e # Any subsequent(*) commands which fail will cause the shell script to exit immediately. Undo with 'set +e'
RELEASE=$1
if [ $# != 1 ] ; then echo "ERROR in execution. Usage: ./load_release.sh <release e.g. software-10-0>"; exit 1 ; fi

checkout()
{
git checkout $1
git pull
echo $(tput setaf 2)DONE$(tput sgr0)
}

echo -e "\n$(tput setaf 3)/root/opentas update...$(tput sgr0)"
cd /root/opentas
checkout

echo -e "\n$(tput setaf 3)/root/opentas/ft update...$(tput sgr0)"
cd /root/opentas/ft
checkout

echo -e "\n$(tput setaf 3)/root/opentas/kubernetes update...$(tput sgr0)"
cd /root/opentas/kubernetes
checkout

echo -e "\n$(tput setaf 3)/root/opentas/ft/vtas-testsuites update...$(tput sgr0)"
cd /root/opentas/ft/vtas-testsuites
checkout

echo -e "\n$(tput setaf 3)/root/opentas/ft/vtas-taf update...$(tput sgr0)"
cd /root/opentas/ft/vtas-taf
checkout

echo -e "\n$(tput setaf 3)/root/opentas/ft/single_vm_stuff update...$(tput sgr0)"
cd /root/opentas/ft/single_vm_stuff
checkout
