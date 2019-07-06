#
# Be sure to run `pod lib lint SSViews.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SSViews'
  s.version          = '0.1.1'
  s.summary          = 'Update your UIKit\'s View'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Add picker in UITextField with just couple of codes.
                       DESC

  s.homepage         = 'https://github.com/shubhamsharma95/SSViews'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'shubhamsharma95' => 'shubham.sharma@arkasoftwares.com' }
  s.source           = { :git => 'https://github.com/shubhamsharma95/SSViews.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.swift_version = '5.0'
  s.ios.deployment_target = '10.0'

  s.source_files = 'SSViews/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SSViews' => ['SSViews/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit' #, 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
