#!/bin/bash

echo "$name"
#ssh root@10.0.3.231 'useradd -m -s /bin/bash $name && adduser $name sudo' 
echo "added!"
#adduser "$name" sudo 
#su - $name

#touch /etc/profile.d/startScript.sh
#chmod +x startScript.sh
#touch ~/welcome.sh
#chmod +x welcome.sh
#echo "welcome to "$name" userspace" > welcome.sh


#echo "#!/bin/bash
#cd ~
#./welcome.sh" > /etc/profile.d/startScript.sh

#su - "$name"