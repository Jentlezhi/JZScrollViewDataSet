#
# Be sure to run `pod lib lint JZScrollViewDataSet.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JZScrollViewDataSet'
  s.version          = '0.1.0'
  s.summary          = '滚动视图空白数据显示框架'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  滚动视图（UIScrollView、UITableView、UICollectionView）空白数据显示框架，支持自定义空白视图和错误视图。
                       DESC

  s.homepage         = 'https://github.com/Jentlezhi'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jentle' => 'juntaozhi@163.com' }
  s.source           = { :git => 'https://github.com/Jentlezhi/JZScrollViewDataSet.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'JZScrollViewDataSet/Classes/**/*'
  
  # s.resource_bundles = {
  #   'JZScrollViewDataSet' => ['JZScrollViewDataSet/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
