require 'serverspec'

set :backend, :exec

describe package('nginx') do
  it { should be_installed }
end

describe service('nginx-single') do
  it { should_not be_running }
  it { should_not be_enabled }
end

describe file('/etc/init.d/nginx-single') do
  it { should_not exist }
end

describe file('/etc/init/nginx-single.conf') do
  it { should_not exist }
end
