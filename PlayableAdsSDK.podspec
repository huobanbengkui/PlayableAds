Pod::Spec.new do |s|
  s.name             = 'PlayableAdsSDK'
  s.version          = '1.0.1'
  s.summary          = 'PlayableAds Ad SDK'


  s.description      = <<-DESC
Playable Ad SDK.
                       DESC

  s.homepage         = 'https://github.com/huobanbengkui'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "huobanbengkui" => "1399633980@qq.com" }
  s.source           = { :git => 'https://github.com/huobanbengkui/PlayableAds.git', :tag => s.version }

  s.ios.deployment_target = '8.0'

  s.resources = "Framework/*"

  s.library = 'sqlite3', 'z'

  s.frameworks = 'AVFoundation'

  s.vendored_frameworks = 'Framework/PlayableAdsSDK.framework'

end
