# Autogenerated by PodBuilder (https://github.com/Subito-it/PodBuilder)
# Any change to this file should be done on PodBuilder/Podfile

platform :ios, '15.0'
use_frameworks!
workspace 'ItunesExample.xcworkspace'

def test_pods
  pod 'Quick', :path => 'PodBuilder/Prebuilt/Quick' # pb<Quick>
  pod 'Nimble', :path => 'PodBuilder/Prebuilt/Nimble' # pb<Nimble>
end

def snapshot_test_pods
  test_pods
  pod 'iOSSnapshotTestCase', :path => 'PodBuilder/Prebuilt/iOSSnapshotTestCase' # pb<Nimble-Snapshots>
  pod 'Nimble', :path => 'PodBuilder/Prebuilt/Nimble' # pb<Nimble-Snapshots>
  pod 'Nimble-Snapshots', :path => 'PodBuilder/Prebuilt/Nimble-Snapshots' # pb<Nimble-Snapshots>
end

target 'ItunesExample' do
  project 'ItunesExample.xcodeproj'

  pod 'SDWebImage', :path => 'PodBuilder/Prebuilt/SDWebImage' # pb<SDWebImageSwiftUI>
  pod 'SDWebImageSwiftUI', :path => 'PodBuilder/Prebuilt/SDWebImageSwiftUI' # pb<SDWebImageSwiftUI>

  target 'ItunesExampleTests' do
    inherit! :search_paths
    snapshot_test_pods
  end

  target 'ItunesExampleUITests' do
    # Pods for testing
  end

end

target 'Networking' do
  project 'Networking/Networking.xcodeproj'

  target 'NetworkingTests' do
    inherit! :search_paths
    test_pods
  end

end

target 'Search' do
  project 'Search/Search.xcodeproj'

  pod 'SDWebImage', :path => 'PodBuilder/Prebuilt/SDWebImage' # pb<SDWebImageSwiftUI>
  pod 'SDWebImageSwiftUI', :path => 'PodBuilder/Prebuilt/SDWebImageSwiftUI' # pb<SDWebImageSwiftUI>

  target 'SearchTests' do
    inherit! :search_paths
    snapshot_test_pods
  end

end

target 'AudioDetail' do
  project 'AudioDetail/AudioDetail.xcodeproj'

  pod 'SDWebImage', :path => 'PodBuilder/Prebuilt/SDWebImage' # pb<SDWebImageSwiftUI>
  pod 'SDWebImageSwiftUI', :path => 'PodBuilder/Prebuilt/SDWebImageSwiftUI' # pb<SDWebImageSwiftUI>

  target 'AudioDetailTests' do
    inherit! :search_paths
    snapshot_test_pods
  end

end

pre_install do |installer|
  Pod::Installer::Xcode::TargetValidator.send(:define_method, :verify_no_duplicate_framework_and_library_names) {}
  require 'pod_builder/podfile/pre_actions_swizzles'
   
end
