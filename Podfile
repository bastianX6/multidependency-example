platform :ios, '10.0'
use_frameworks!
workspace 'ItunesExample.xcworkspace'

target 'ItunesExample' do
  project 'ItunesExample.xcodeproj'

  pod 'Alamofire'
  pod 'SDWebImage'

  target 'ItunesExampleTests' do
    inherit! :search_paths
    pod "Quick"
    pod "Nimble"
    pod "Nimble-Snapshots"
  end

  target 'ItunesExampleUITests' do
    # Pods for testing
  end

end
