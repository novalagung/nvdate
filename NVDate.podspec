Pod::Spec.new do |spec|
  spec.name              = 'NVDate'
  spec.platforms         = { :ios => "7.0", :osx => "10.9", :tvos => "9.0", :watchos => "2.0" }
  spec.version           = '1.0.2'
  spec.authors           = { 'Noval Agung Prayogo' => 'caknopal@gmail.com' }
  spec.license           = { :type => 'MIT', :file => 'LICENSE' }
  spec.homepage          = 'https://github.com/novalagung/NVDate'
  spec.source            = { :git => 'https://github.com/novalagung/NVDate.git', :tag => '1.0.2' }
  spec.summary           = 'NSDate extension library'
  spec.description       = <<-DESC
                             **NVDate** is an extension of NSDate, created to make date and time manipulation easier.
                           DESC
  spec.documentation_url = 'https://github.com/novalagung/NVDate/wiki/API-Reference'
  spec.source_files      = 'NVDate.{h,m}'
  spec.requires_arc      = true
end
