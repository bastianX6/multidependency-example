Pod::Spec.new do |p1|
    p1.name             = 'Quick'
    p1.version          = '5.0.1'
    p1.summary          = 'The Swift (and Objective-C) testing framework.'
    p1.homepage         = 'https://github.com/Quick/Quick'
    p1.author           = 'PodBuilder'
    p1.source           = { 'git' => 'https://github.com/Quick/Quick.git'}
    p1.license          = { :type => 'Apache 2.0' }

    p1.ios.deployment_target = '15.0'

    p1.vendored_frameworks = 'Quick.xcframework'
    p1.frameworks = 'XCTest'
end