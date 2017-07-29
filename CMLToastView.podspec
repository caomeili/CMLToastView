
Pod::Spec.new do |s|
  s.name             = 'CMLToastView'
  s.version          = '1.0.1'
  s.summary          = 'A short description of CMLToastView.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/caomeili/CMLToastView'
  s.author           = { 'caomeili' => 'caoml@ushareit.com' }
  s.source           = { :git => 'git@github.com:caomeili/ToastView.git', :tag => s.version.to_s }
  s.ios.deployment_target = '7.0'
  s.default_subspec = 'CoreFramework'
  s.subspec 'Core' do |ss|
    ss.source_files = 'CMLToastView/Classes/**/*'
    ss.public_header_files = 'CMLToastView/Classes/**/*.h'

  end

  s.subspec 'CoreFramework' do |ss|
    ss.ios.vendored_frameworks = 'CMLToastView-1.0.0/ios/CMLToastView.framework'
  end
  s.resource_bundles = {
    'CMLToastView' => ['CMLToastView/Assets/**/*.png']
  }
end
