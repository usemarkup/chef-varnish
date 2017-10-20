describe yum.repo('varnish') do
  it { should exist }
  it { should be_enabled }
end

describe package('varnish') do
  it { should be_installed }
end

describe service('varnish') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end
