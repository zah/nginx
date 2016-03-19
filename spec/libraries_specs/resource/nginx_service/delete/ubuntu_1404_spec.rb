describe 'resource_nginx_service :delete on ubuntu 14.04' do
  before do
    allow(Chef::Platform::ServiceHelpers).to receive(:service_resource_providers).and_return([:upstart])
  end

  cached(:chef_run) do
    ChefSpec::SoloRunner.new(
      step_into: 'nginx_service',
      platform: 'ubuntu',
      version: '14.04'
    ).converge('nginx_service_test::delete')
  end

  it_behaves_like 'delete a named nginx_service', 'single'

  it_behaves_like 'nginx_service :delete #upstart', 'single'
end
