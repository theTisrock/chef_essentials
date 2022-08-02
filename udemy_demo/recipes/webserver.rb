package 'apache' do
  action :install
  case node[:platform_family]
    when 'rhel'
      package_name 'httpd'
    when 'debian'
      package_name 'apache2'
  end
end

service 'apache' do
  action [:start, :enable]
  case node[:platform_family]
    when 'rhel'
      service_name 'httpd'
    when 'debian'
      service_name 'apache2'
  end
end


