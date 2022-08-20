Pod::Spec.new do |p1|
    p1.name             = 'SDWebImage'
    p1.version          = '5.13.2'
    p1.summary          = 'Asynchronous image downloader with cache support with an UIImageView category.'
    p1.homepage         = 'https://github.com/SDWebImage/SDWebImage'
    p1.author           = 'PodBuilder'
    p1.source           = { 'git' => 'https://github.com/SDWebImage/SDWebImage.git'}
    p1.license          = { :type => 'MIT' }

    p1.ios.deployment_target = '15.0'

    p1.default_subspecs = 'Core'
    p1.frameworks = 'ImageIO'

    p1.subspec 'Core' do |p2|
        p2.vendored_frameworks = 'SDWebImage.xcframework'
    end
end