

# version the python install script
template 'python install' do
  path '/home/ubuntu/python_install'
  source 'python_install.erb'
  owner 'ubuntu'
  group 'ubuntu'
  mode '0755'
  variables ({
    'pythonVersion' => '3.10.5',
  })
end


# install python
execute 'install python' do
  command '/home/ubuntu/python_install'
  group 'root'
  action :run
end


# display python version
execute 'echo python version' do
  command '/usr/local/bin/python3 --version >> .python-version'
  group 'root'
  action :run
end

