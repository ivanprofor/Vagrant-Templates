# Inspired from here https://scotch.io/tutorials/how-to-create-a-vagrant-base-box-from-an-existing-one
# Profor Ivan, 2020-06-16

# Run the script as root!

# Define the simple user
usr=(iprofor)


# Outside the box (on the host)
vagrant up
vagrant ssh


# Inside the box

# Make the Box as Small as possible
apt-get clean &&\
dd if=/dev/zero of=/EMPTY bs=1M &&\
rm -f /EMPTY

# clear the Bash History
cat /dev/null > ~/.bash_history
history -c
exit

# Outside the box (on the host)

# repackage the server we just created into a new Vagrant Base Box.
vagrant package --output mynew.box

# Add the Box into Your Vagrant Install
vagrant box add mynewbox mynew.box


# clean the working directory if necessary
vagrant destroy -f
rm -f Vagrantfile


# Initialize Your New Vagrant Box from any place inside the host
vagrant init mynewbox


