describe command('curl -I 127.0.0.1:881 --header \'If-None-Match: "58173b0b-e72"\'') do
  its('stdout') { should match 'HTTP/1.1 304 Not Modified' }
end

describe http('http://127.0.0.1:881', enable_remote_worker: true) do
  its('status') { should cmp 200 }
  its('body') { should match 'Test Page for the Nginx HTTP Server on EPEL' }
end
