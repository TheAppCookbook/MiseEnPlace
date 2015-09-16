Pod::Spec.new do |spec|
  spec.name             = 'MiseEnPlace'
  spec.version          = '0.0.1'
  spec.license          = { :type => 'MIT' }
  spec.homepage         = 'https://github.com/TheAppCookbook/MiseEnPlace'
  spec.authors          = { 'The App Cookbook' => 'the@appcookbook.in' }
  spec.summary          = '​An arrangement of ingredients that a cook will require.'
  spec.source           = { :git => 'https://github.com/TheAppCookbook/MiseEnPlace.git', :branch => 'master' }
  spec.source_files     = 'source/*.swift'
  spec.platform         = :ios, '9.0'
  spec.dependency         'UIScrollView-InfiniteScroll'
  spec.dependency         'AFNetworking'
end