Pod::Spec.new do |spec|
  spec.name = "MEReactiveFoundation"
  spec.version = "1.0.4"
  spec.authors = {"William Towe" => "willbur1984@gmail.com"}
  spec.license = {:type => "MIT", :file => "LICENSE.txt"}
  spec.homepage = "https://github.com/TeamMaestro/MEReactiveFoundation"
  spec.source = {:git => "https://github.com/TeamMaestro/MEReactiveFoundation.git", :tag => spec.version.to_s}
  spec.summary = "A collection of classes that extend the Foundation framework collection classes with functionality commonly found in functional languages (e.g. Haskell). Compatible with iOS/OSX, 7.0+/10.9+."
  spec.description = "Includes the commonly found transformations present in functional languages (e.g. Haskell). For example, map, filter, find, fold, zip, unzip, and concat."
  
  spec.ios.deployment_target = "7.0"
  spec.osx.deployment_target = "10.9"
  
  spec.requires_arc = true
  spec.frameworks = "Foundation"
  
  spec.source_files = "MEReactiveFoundation", "MEReactiveFoundation/Private"
  spec.private_header_files = "MEReactiveFoundation/Private"
end
