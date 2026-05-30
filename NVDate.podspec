Pod::Spec.new do |spec|
  spec.name              = 'NVDate'
  spec.platforms         = { :ios => "12.0", :osx => "10.13", :tvos => "12.0", :watchos => "4.0" }
  spec.version           = '3.0.0'
  spec.authors           = { 'Noval Agung Prayogo' => 'caknopal@gmail.com' }
  spec.license           = { :type => 'MIT', :file => 'LICENSE' }
  spec.homepage          = 'https://github.com/novalagung/NVDate'
  spec.readme            = "https://raw.githubusercontent.com/novalagung/NVDate/#{spec.version}/README.md"
  spec.source            = { :git => 'https://github.com/novalagung/NVDate.git', :tag => '3.0.0' }
  spec.summary           = 'Swift Date utility library'
  spec.description       = <<-DESC
                             **NVDate** is a Swift Date utility library, created to make date and time manipulation easier.
                           DESC
  spec.documentation_url = 'https://github.com/novalagung/NVDate/wiki/API-Reference'
  spec.source_files      = 'NVDate.swift'
  spec.requires_arc      = true
  spec.swift_version     = '6.0'
end
