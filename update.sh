# Script to update git submodules

set -e # When any of the next commands fail the shell script will exit immediately.
if [ $# != 0 ] ; then echo "ERROR in execution. Usage: ./update.sh "; echo "Updates only the current checked-out branch"; exit 1 ; fi

echo -e "\n$(tput setaf 3)/root/opentas update...$(tput sgr0)"
cd /root/opentas
git --git-dir "/root/opentas/.git" --work-tree=/root/opentas pull

echo -e "\n$(tput setaf 3)/root/opentas/ft update...$(tput sgr0)"
cd /root/opentas/ft
git --git-dir "/root/opentas/.git" --work-tree="/root/opentas" submodule update --recursive
git --work-tree=/root/opentas/ft pull

echo -e "\n$(tput setaf 3)/root/opentas/kubernetes update...$(tput sgr0)"
cd /root/opentas/kubernetes
git --git-dir "/root/opentas/kubernetes/.git" --work-tree=/root/opentas/kubernetes pull

echo -e "\n$(tput setaf 3)/root/opentas/ft/vtas-testsuites update...$(tput sgr0)"
cd /root/opentas/ft/vtas-testsuites
git --git-dir "/root/opentas/ft/vtas-testsuites/.git" --work-tree=/root/opentas/ft/vtas-testsuites pull

echo -e "\n$(tput setaf 3)/root/opentas/ft/vtas-taf update...$(tput sgr0)"
cd /root/opentas/ft/vtas-taf
git --git-dir "/root/opentas/ft/vtas-taf/.git" --work-tree=/root/opentas/ft/vtas-taf pull

echo -e "\n$(tput setaf 3)/root/opentas/ft/single_vm_stuff update...$(tput sgr0)"
cd /root/opentas/ft/single_vm_stuff
git --git-dir "/root/opentas/ft/vtas-taf/.git" --work-tree=/root/opentas/ft/single_vm_stuff pull
