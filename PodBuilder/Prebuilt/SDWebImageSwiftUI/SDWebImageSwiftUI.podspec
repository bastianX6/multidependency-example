Pod::Spec.new do |p1|
    p1.name             = 'SDWebImageSwiftUI'
    p1.version          = '2.0.2'
    p1.summary          = 'SwiftUI Image loading and Animation framework powered by SDWebImage'
    p1.homepage         = 'https://github.com/SDWebImage/SDWebImageSwiftUI'
    p1.author           = 'PodBuilder'
    p1.source           = { 'git' => 'https://github.com/SDWebImage/SDWebImageSwiftUI.git'}
    p1.license          = { :type => 'MIT' }

    p1.ios.deployment_target = '15.0'

    p1.vendored_frameworks = 'SDWebImageSwiftUI.xcframework'
    p1.dependency 'SDWebImage'
end