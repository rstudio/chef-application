#
# Copyright 2015, Noah Kantrowitz
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'rspec'
require 'chefspec'
require 'rspec/its'
require 'halite/spec_helper'
require 'simplecov'

# If we have a token, use codeclimate
if ENV['CODECLIMATE_REPO_TOKEN']
  require 'codeclimate-test-reporter'
  SimpleCov.formatter = CodeClimate::TestReporter::Formatter
end

SimpleCov.start do
  # Don't get coverage on the test cases themselves
  add_filter '/test/'
end

require 'poise_application'

RSpec.configure do |config|
  # Basic configuraiton
  config.run_all_when_everything_filtered = true
  config.filter_run(:focus)

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  config.include Halite::SpecHelper
end
