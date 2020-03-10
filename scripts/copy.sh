# Create an SSH key on Heroku in order to copy data from server via SCP
ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N ""
cat ~/.ssh/id_rsa.pub
