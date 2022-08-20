Pod::Spec.new do |p1|
    p1.name             = 'Nimble-Snapshots'
    p1.version          = '9.4.0'
    p1.summary          = 'Nimble matchers for iOSSnapshotTestCase'
    p1.homepage         = 'https://github.com/ashfurrow/Nimble-Snapshots'
    p1.author           = 'PodBuilder'
    p1.source           = { 'git' => 'https://github.com/ashfurrow/Nimble-Snapshots.git'}
    p1.license          = { :type => 'MIT' }

    p1.ios.deployment_target = '15.0'

    p1.default_subspecs = 'Core'
    p1.frameworks = 'Foundation', 'UIKit', 'XCTest'

    p1.subspec 'Core' do |p2|
        p2.vendored_frameworks = 'Nimble_Snapshots.xcframework'
        p2.dependency 'Nimble'
        p2.dependency 'iOSSnapshotTestCase'
    end
end