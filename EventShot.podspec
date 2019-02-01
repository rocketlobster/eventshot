#
# Be sure to run `pod lib lint EventShot.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EventShot'
  s.version          = '0.1.7'
  s.summary          = 'Log events with screenshots'

  s.description      = <<-DESC
Troubleshoot tracking or asynchronous events in iOS by saving screenshots with metadata in your photoroll.
                       DESC

  s.homepage         = 'https://github.com/rocketlobster/eventshot'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rocketlobster' => 'theo@cheerz.com' }
  s.source           = { :git => 'https://github.com/rocketlobster/eventshot.git', :tag => s.version.to_s }

  s.swift_version = '>= 4.0'
  s.ios.deployment_target = '8.0'

  s.source_files = 'EventShot/Classes/**/*'
  
  # s.resource_bundles = {
  #   'EventShot' => ['EventShot/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
