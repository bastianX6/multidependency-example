Pod::Spec.new do |p1|
    p1.name             = 'Nimble'
    p1.version          = '10.0.0'
    p1.summary          = 'A Matcher Framework for Swift and Objective-C'
    p1.homepage         = 'https://github.com/Quick/Nimble'
    p1.author           = 'PodBuilder'
    p1.source           = { 'git' => 'https://github.com/Quick/Nimble.git'}
    p1.license          = { :type => 'Apache 2.0' }

    p1.ios.deployment_target = '15.0'

    p1.vendored_frameworks = 'Nimble.xcframework'
end