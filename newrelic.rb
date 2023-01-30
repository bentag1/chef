# Install the New Relic agent
package 'newrelic-infra' do
    action :install
  end
  
  # Create the New Relic configuration file
  template '/etc/newrelic-infra.yml' do
    source 'newrelic-infra.yml.erb'
    variables(
      license_key: '23898a641328015bbaacd4abd4427ebaa65dNRAL',
    )
    notifies :restart, 'service[newrelic-infra]'
  end
  
  # Start and enable the New Relic agent
  service 'newrelic-infra' do
    action [:enable, :start]
  end
  