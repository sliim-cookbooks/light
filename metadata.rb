# -*- coding: utf-8 -*-

name 'light'
maintainer 'Sliim'
maintainer_email 'sliim@mailoo.org'
license 'Apache-2.0'
description 'The light Cookbook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
chef_version '>= 12.5' if respond_to?(:chef_version)
version '1.0.0'

recipe 'light::default', 'Installs light'

supports 'debian'
supports 'ubuntu'

source_url 'https://github.com/sliim-cookbooks/light' if
  respond_to?(:source_url)
issues_url 'https://github.com/sliim-cookbooks/light/issues' if
  respond_to?(:issues_url)
