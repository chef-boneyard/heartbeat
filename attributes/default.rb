
case node['platform']
when "centos", "redhat"
    node['packages'] = ['heartbeat', 'heartbeat-devel']
when "ubuntu", "devian"
    node['packages'] = ['heartbeat', 'heartbeat-dev']
end
