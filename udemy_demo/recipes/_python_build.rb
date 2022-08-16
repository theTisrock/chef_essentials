# install python build dependencies first
node.default['udemy_demo']['python_build']['dependencies'] = [
  'build-essential',
  'zlib1g-dev',
  'libncurses5-dev',
  'libgdbm-dev',
  'libnss3-dev',
  'libssl-dev',
  'libreadline-dev',
  'wget',
  'libc6-dev',
  'libsqlite3-dev',
  'libbz2-dev',
  'libffi-dev',
  'gcc',
  'make',
]

node.default['udemy_demo']['python_build']['dependencies'].each do |dep|
  package dep do
    action :install
  end
end

# to install python update the version in attributes/default.rb

# generate the python install script
template 'python installation' do
    path '/home/install_python'
    source '_install_python.erb'
    owner 'root'
    group 'root'
    user 'root'
    mode '0755'
    variables ({
        'python_version' => node.default['udemy_demo']['python_build']['python_version'],
        'openssl_url' => node.default['udemy_demo']['python_build']['openssl']['url'],
        'openssl_resource' => node.default['udemy_demo']['python_build']['openssl']['resource'],
        'python_url' => node.default['udemy_demo']['python_build']['url'],
        'force_build' => "false",
    })
end


# install python 3
execute 'install python' do
    command '/home/install_python'
    user 'root'
    action :run
end


# ensure pip & pipenv in python 3 - Don't install libraries here other than python tools; use virtualenv instead
node.default['udemy_demo']['install_packages']['pip3'].each do |python_package, version|
    execute 'install python 3 tools' do
        command "/usr/local/bin/pip3 install #{python_package}==#{version}"
        user 'root'
        action :run
    end
end

