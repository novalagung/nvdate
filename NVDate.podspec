Pod::Spec.new do |spec|
  spec.name              = 'NVDate'
  spec.platform          = :ios, "8.0"
  spec.version           = '2.0.1'
  spec.authors           = { 'Noval Agung Prayogo' => 'caknopal@gmail.com' }
  spec.license           = { :type => 'MIT', :file => 'LICENSE' }
  spec.homepage          = 'https://github.com/novalagung/NVDate'
  spec.source            = { :git => 'https://github.com/novalagung/NVDate.git', :tag => '2.0.1' }
  spec.summary           = 'Swift Date extension library'
  spec.description       = <<-DESC
                             **NVDate** is an extension of swift Date class, created to make date and time manipulation easier.
                           DESC
  spec.documentation_url = 'https://github.com/novalagung/NVDate/wiki/API-Reference'
  spec.source_files      = 'NVDate.swift'
  spec.requires_arc      = true
  spec.swift_version     = '4.0'
end
