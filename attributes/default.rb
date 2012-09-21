
case node['platform']
when "centos", "redhat"
    node['heartbeat']['packages'] = ['heartbeat', 'heartbeat-devel']
when "ubuntu", "debian"
    node['heartbeat']['packages'] = ['heartbeat', 'heartbeat-dev']
end
