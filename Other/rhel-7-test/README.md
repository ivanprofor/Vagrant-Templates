`unzip cdk-*.zip && cd cdk/plugins`  
`vagrant plugin install vagrant-registration`  

or  
`vagrant plugin install vagrant-registration vagrant-service-manager vagrant-sshfs`

`vagrant box add rhel/7.3 file://rhel-cdk-kubernetes-*.vagrant-*.box`  
`vagrant init rhel/7.3`  


You can set up the credentials as follows:

Vagrant.configure('2') do |config|
  ...
  if Vagrant.has_plugin?('vagrant-registration')
    config.registration.username = 'foo'
    config.registration.password = 'bar'
  end

  # Alternatively
  if Vagrant.has_plugin?('vagrant-registration')
    config.registration.org = 'foo'
    config.registration.activationkey = 'bar'
  end
  ...
end

This should go, preferably, into the Vagrantfile in your Vagrant home directory (defaults to ~/.vagrant.d), to make it available for every project. It can be later overridden in an individual project’s Vagrantfile if needed.

If you prefer not to store your username and/or password on your filesystem, you can optionally configure vagrant-registration plugin to use environment variables such as:

Vagrant.configure('2') do |config|
  ...
  config.registration.username = ENV['SUB_USERNAME']
  config.registration.password = ENV['SUB_PASSWORD']
  ...
end

If you do not configure your credentials as outlined above, you will receive a maximum of 3 prompts for them during the vagrant up process.

Run it:

`vagrant up`
