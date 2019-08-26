# -*- coding: utf-8 -*-

require 'chefspec'
require 'chefspec/berkshelf'

describe 'light::default' do
  let(:subject) do
    ChefSpec::SoloRunner.new(platform: 'debian', version: '9.0') do |node|
      node.override['light']['install_dir'] = '/opt/light'
      node.override['light']['repository'] = 'https://custom/repo.git'
      node.override['light']['reference'] = 'custom-ref'
      node.override['light']['env'] = 'custom-env'
    end.converge(described_recipe)
  end

  it 'syncs git[/opt/light]' do
    expect(subject).to sync_git('/opt/light')
      .with(repository: 'https://custom/repo.git',
            reference: 'custom-ref',
            environment: 'custom-env')
  end

  ['/etc/light/save', '/etc/light/mincap'].each do |dir|
    it "creates directory[#{dir}]" do
      expect(subject).to create_directory(dir)
        .with(owner: 'root',
              group: 'root',
              mode: '0755',
              recursive: true)
    end
  end

  it 'creates link[/usr/local/bin/light]' do
    expect(subject).to create_link('/usr/local/bin/light')
      .with(owner: 'root',
            group: 'root',
            to: '/opt/light/light')
  end

  it 'creates file[/etc/udev/rules.d/90-backlight.rules]' do
    expect(subject).to create_file('/etc/udev/rules.d/90-backlight.rules')
      .with(owner: 'root',
            group: 'root',
            mode: '0640')
  end
end
