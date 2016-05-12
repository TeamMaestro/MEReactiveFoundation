Pod::Spec.new do |spec|
  spec.name = "MEReactiveFoundation"
  spec.version = "1.1.0"
  spec.authors = {"William Towe" => "willbur1984@gmail.com"}
  spec.license = {:type => "MIT", :file => "LICENSE.txt"}
  spec.homepage = "https://github.com/TeamMaestro/MEReactiveFoundation"
  spec.source = {:git => "https://github.com/TeamMaestro/MEReactiveFoundation.git", :tag => spec.version.to_s}
  spec.summary = "A collection of classes that extend the Foundation collection classes with functionality found in functional languages."
  spec.description = "A collection of classes that extend the Foundation collection classes with functionality found in functional languages (e.g. Haskell). Examples include: map, filter, find, fold, zip, unzip, and concat. Compatible with iOS/OSX, 7.0+/10.9+."
  
  spec.ios.deployment_target = "8.0"
  spec.osx.deployment_target = "10.9"
  
  spec.requires_arc = true
  spec.frameworks = "Foundation"
  
  spec.source_files = "MEReactiveFoundation/**/*.{h,m}"
  spec.private_header_files = "MEReactiveFoundation/Private/**/*.h"
end
