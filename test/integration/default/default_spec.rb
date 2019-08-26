# -*- coding: utf-8 -*-

['/opt/light', '/etc/light/save', '/etc/light/mincap'].each do |dir|
  describe file dir do
    it { should exist }
    it { should be_directory }
    it { should be_owned_by 'root' }
  end
end

describe file '/opt/light/light' do
  it { should exist }
  it { should be_file }
  it { should be_executable }
  it { should be_owned_by 'root' }
end

describe file '/usr/local/bin/light' do
  it { should exist }
  it { should be_linked_to '/opt/light/light' }
end

describe file '/etc/udev/rules.d/90-backlight.rules' do
  it { should exist }
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end
