Pod::Spec.new do |p1|
    p1.name             = 'iOSSnapshotTestCase'
    p1.version          = '8.0.0'
    p1.summary          = 'Snapshot view unit tests for iOS'
    p1.homepage         = 'https://github.com/uber/ios-snapshot-test-case'
    p1.author           = 'PodBuilder'
    p1.source           = { 'git' => 'https://github.com/uber/ios-snapshot-test-case.git'}
    p1.license          = { :type => 'MIT' }

    p1.ios.deployment_target = '15.0'

    p1.default_subspecs = 'SwiftSupport'
    p1.frameworks = 'Foundation', 'QuartzCore', 'UIKit', 'XCTest'

    p1.subspec 'Core' do |p2|
        p2.vendored_frameworks = 'FBSnapshotTestCase.xcframework'
    end

    p1.subspec 'SwiftSupport' do |p2|
        p2.vendored_frameworks = 'FBSnapshotTestCase.xcframework'
        p2.dependency 'iOSSnapshotTestCase/Core'
    end
end