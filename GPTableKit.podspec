Pod::Spec.new do |s|

  s.name             = 'GPTableKit'
  s.version          = '1.0.0'
  s.summary          = 'Display tableView using sections and rows.'
  s.homepage         = 'https://github.com/GraveParty/GPTableKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Orisun' => 'wdyang13@163.com' }
  
  s.platform         = :ios
  s.ios.deployment_target = '10.0'
  s.swift_versions   = '5.4'
  s.source_files     = 'GPTableKit/Classes/**/*'
  s.prefix_header_contents = '#import "NSArray+GPUtil.h"'
  
  s.source           = { :git => 'https://github.com/GraveParty/GPTableKit.git', :tag => s.version.to_s }
end
