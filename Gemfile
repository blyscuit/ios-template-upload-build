source "https://rubygems.org"

gem "cocoapods"
gem "fastlane", :git => 'git@github.com:blyscuit/fastlane-swift-group.git', :ref => 'a095153'
gem "xcov"
gem "danger"
gem "danger-swiftlint"
gem "danger-xcode_summary"
gem 'danger-swiftformat'
gem 'danger-xcov'

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)
