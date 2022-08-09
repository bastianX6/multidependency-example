platform :ios, '10.0'
use_frameworks!
workspace 'ItunesExample.xcworkspace'

def test_pods
  pod "Quick"
  pod "Nimble"
end

def snapshot_test_pods
  test_pods
  pod "Nimble-Snapshots"
end

target 'ItunesExample' do
  project 'ItunesExample.xcodeproj'

  pod 'SDWebImage'

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