Pod::Spec.new do |s|
s.name             = 'PlayableAdsSDK'
s.version          = '1.0.1'
s.summary          = 'PlayableAds Ad SDK'
s.description      = <<-DESC
PlayableAds Ad SDK.
                    DESC

s.homepage         = 'http://ads-sdk-doc.haloapps.com/docs/show/2'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { "steve" => "steve.liu@holaverse.com" }
s.source           = { :git => 'https://github.com/guojunliu/AvidlyAdsSDK.git', :tag => s.version }

s.ios.deployment_target = '8.0'

s.source_files = 'Framework/Appnext/include/*', 'Framework/Chance/include/*', 'Framework/Domob/include/*'

s.resources = "Framework/Chance/resource/*", "Framework/Domob/resource/*", "Framework/Vungle/resource/*", "Framework/AvidlyAdsSDK/resource/*",

s.public_header_files = 'Framework/Appnext/include/*', 'Framework/Chance/include/*', 'Framework/Domob/include/*'

s.library = 'sqlite3', 'z'

s.frameworks = 'QuartzCore', 'MediaPlayer', 'CoreMedia', 'CoreGraphics', 'CFNetwork', 'WebKit', 'WatchConnectivity', 'SystemConfiguration', 'StoreKit', 'Social', 'MessageUI','JavaScriptCore','EventKit','CoreTelephony','AVFoundation','AudioToolbox','AdSupport'

s.vendored_libraries = "Framework/Appnext/libAppnextLib.a", "Framework/Appnext/libAppnextSDKCore.a", "Framework/Chance/libChanceAd_Video.a", "Framework/Domob/libIndependentVideoSDK.a"

s.vendored_frameworks = 'Framework/AdColony/AdColony.framework', 'Framework/Mobvista/MVSDK.framework', 'Framework/Mobvista/MVSDKReward.framework', 'Framework/Unity/UnityAds.framework', 'Framework/Vungle/VungleSDK.framework', 'Framework/AvidlyAdsSDK/AvidlyAdsSDK.framework', 'Framework/FBAudienceNetwork/FBAudienceNetwork.framework', 'Framework/GoogleMobileAds/GoogleMobileAds.framework', 'Framework/HolaStatisticalSDK/HolaStatisticalSDK.framework', 'Framework/OneWay/OneWaySDK.framework'
end
