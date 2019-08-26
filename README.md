light Cookbook - [![Cookbook Version](https://img.shields.io/cookbook/v/light.svg)](https://community.opscode.com/cookbooks/light) [![Build Status](https://travis-ci.org/sliim-cookbooks/light.svg?branch=master)](https://travis-ci.org/sliim-cookbooks/light)
================
The light Cookbook - Installs light

Requirements
------------
#### Platforms
The following platforms and versions are tested and supported using Opscode's test-kitchen.
- `Debian 9`
- `Ubuntu 16.04`

Attributes
----------
#### light::default
| Key                    | Type   | Description                                                        |
| ---------------------- | ------ | ------------------------------------------------------------------ |
| `[light][install_dir]` | String | Installation directory (default: `/opt/light`)                     |
| `[light][repository]`  | String | light repository (default: `https://github.com/haikarainen/light`) |
| `[light][reference]`   | String | light repository branch or tag (default: `master`)                 |
| `[light][env]`         | Hash   | environment for git resource (default: `nil`)                      |

Usage
-----
#### light::default
Include the `light` recipe in your run_list to install light:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[light]"
  ]
}
```

Testing
-------
See [TESTING.md](TESTING.md)

Contributing
------------
See [CONTRIBUTING.md](CONTRIBUTING.md)

## License and Authors

Authors: Sliim <sliim@mailoo.org>

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

