Chef Solo Laptop
================

This repository contains chef cookbooks and recipes for the provision
of my laptop.

Chef
----

[Chef](http://www.opscode.com/chef/ "Chef homepage") provides a means
to provision a (cluster of) machine.

Because we do not want to depend on a chef-server we opt to use the
[chef-solo](http://wiki.opscode.com/display/chef/Chef+Solo "Documentation about chef solo")
instance.

Procedure
---------

In this section the procedure for getting the provision of a laptop up
and running is described here. A summary is given below.

### Summary

* Ubuntu (12.04)
* Git
* Clone Repository
* Install Chef Solo
* Run Chef Solo

### Ubuntu

Install the latest version of 
[Ubuntu](http://www.ubuntu.com/ "Homepage of Ubuntu"). When this
procudure was described the latest version was Ubuntu 12.04 LTS
Precise Pangolin.

### Git

Execute the command below to install [git](http://git-scm.com/ "Homepage of git").

    sudo apt-get install git

Git is used to retrieve this repository which contains all the utility
scripts, cookbooks and recipies needed to get started.

The above step is captured into 
[scripts/install-git.sh](https://github.com/dvberkel/chef-solo-laptop/blob/master/scripts/install-git.sh)

### Clone Repository

Choose an appropriate directory in which to clone this repository. In
that directory execute the following command

    git clone git://github.com/dvberkel/chef-solo-laptop.git

This will clone the repository into a directory called
`chef-solo-laptop`.

The command above can be found in the script
[scripts/clone-repository.sh](https://github.com/dvberkel/chef-solo-laptop/blob/master/scripts/clone-repository.sh)

### Install Chef Solo

Chef Solo need to be installed to run the various cookbooks and
recipies. Detailed information can be found on the
[installation page](http://wiki.opscode.com/display/chef/Installing+Chef+Client+on+Ubuntu+or+Debian "Installing Chef Solo Documentation")
at Opscode. We will list the commands that need to be executed. These
commands are captured into the 
[scripts/chef-solo.sh](https://github.com/dvberkel/chef-solo-laptop/blob/master/scripts/install-chef-solo.sh)
script. This script can be executed instead of running the commands below.

We are using the Opscode APT repository. This way it is easy to keep
Chef up to date. Execute the following command to add the Opscode APT
to the source list.

    echo "deb http://apt.opscode.com/ `lsb_release -cs`-0.10 main" | sudo tee /etc/apt/sources.list.d/opscode.list

The next step is adding the OpsCode GPG key so the downloads can be verified.

    sudo mkdir -p /etc/apt/trusted.gpg.d
    gpg --keyserver keys.gnupg.net --recv-keys 83EF826A
    gpg --export packages@opscode.com | sudo tee /etc/apt/trusted.gpg.d/opscode-keyring.gpg > /dev/null

Update the index with the following command

    sudo apt-get update

And install `opscode-keyring` to keep the keyring up to date.

    sudo apt-get install opscode-keyring # permanent upgradeable keyring

To ensure we use the latest libraries that Chef depends on we have to
upgrade the installation.

    sudo apt-get upgrade

Finally install chef via apt-get.

    sudo apt-get install chef

Because we are only intend to run Chef Solo the Chef Server Url can be
set to 'none'. (The install script has these values preseeded.)

### Run Chef Solo

Now that Chef Solo is installed we should use it. Execute the
following command to provision your laptap.

    chef-solo -c solo.rb -j solo.json

This will execute the recipe in
`cookbooks/basic-setup/recipes/default.rb`

The above command can be executed with the
[scripts/provision.sh](https://github.com/dvberkel/chef-solo-laptop/blob/master/scripts/provision.sh)
script.

Basic Setup
-----------

The basic setup for the computer is described in the `basic-setup`
cookbook, in particular in the 
[default](https://github.com/dvberkel/chef-solo-laptop/blob/master/cookbooks/basic-setup/recipes/default.rb)
recipe.

The documentation about
[resources](http://wiki.opscode.com/display/chef/Resources "Opscode documentation about resources")
is a good place to start understanding the syntax of various elements
in the recipes.
