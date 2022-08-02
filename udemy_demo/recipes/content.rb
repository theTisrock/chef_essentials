node.default['udemy_demo']['companyName'] = "Tisrock Whiskey inline attribute"
node.default['udemy_demo']['productList'] = ["Old Forester 1910", "Woodford Reserve", "Casamigos Anejo"]


file 'landing page' do
  content '<html><body>landing page</body></html>'
  mode '0755'
  owner 'ubuntu'
  group 'ubuntu'
end


template 'products page' do
  path '/var/www/html/mycompany.html'
  source 'mycompany.html.erb'
  mode '0755'
  owner 'ubuntu'
  group 'ubuntu'
  variables ({
    'companyName' => node['udemy_demo']['companyName'],
    'productList' => node['udemy_demo']['productList'],
  })
end


cookbook_file 'static file' do
  path '/var/www/html/webpage.html'
  source 'webpage.html'
  action :create
  mode '0755'
  owner 'ubuntu'
  group 'ubuntu'
end


