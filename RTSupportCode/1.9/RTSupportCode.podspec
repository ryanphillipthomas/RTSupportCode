#
# Be sure to run `pod lib lint RTSupportCode.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RTSupportCode'
  s.version          = '1.9'
  s.summary          = 'Unlock functionality on any application but in a way that is not publicly visible.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
RTSupportCode provides great use for any iOS application. What it does is enables the user to unlock functionality on an application but doing in a way that is not publicly visible. For example it can be used to switch an app from the live server to the development server, enable logging of analytic events, display screen touches in an app for demos, etc.. RTSupportCodeFramework can allow all these things without the need for a developer to update the app.
                       DESC

  s.homepage         = 'https://github.com/ryanphillipthomas/RTSupportCode'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ryanphillipthomas' => 'ryanphillipthomas@mac.com' }
  s.source           = { :git => 'https://github.com/ryanphillipthomas/RTSupportCode.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'RTSupportCode/Classes/**/*'

  # s.resource_bundles = {
  #   'RTSupportCode' => ['RTSupportCode/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
