Pod::Spec.new do |s|
  s.name = "CMLToastView"
  s.version = "1.0.0"
  s.summary = "A short description of CMLToastView."
  s.authors = {"caomeili"=>"caoml@ushareit.com"}
  s.homepage = "https://github.com/caomeili/CMLToastView"
  s.description = "TODO: Add long description of the pod here."
  s.source = { :path => '.' }

  s.ios.deployment_target    = '7.0'
  s.ios.vendored_framework   = 'ios/CMLToastView.framework'
end
