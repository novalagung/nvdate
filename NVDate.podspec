Pod::Spec.new do |spec|
  spec.name              = 'NVDate'
  spec.version           = '0.2.0'
  spec.authors           = { 'Noval Agung Prayogo' => 'caknopal@gmail.com' }
  spec.license           = { :type => 'MIT', :file => 'LICENSE' }
  spec.homepage          = 'http://novalagung.com/NVDate'
  spec.source            = { :git => 'https://github.com/novalagung/NVDate.git', :tag => '0.2.0' }
  spec.summary           = 'NSDate extension library'
  spec.description       = <<-DESC
                             **NVDate** is an extension of NSDate, aim to make date and time manipulation easier.
                           DESC
  spec.documentation_url = 'https://github.com/novalagung/NVDate/wiki/API-Reference'
  spec.source_files      = 'NVDate.{h,m}'
  spec.requires_arc      = true
end
