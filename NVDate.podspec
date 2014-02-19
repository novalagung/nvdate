Pod::Spec.new do |s|
  s.name         = "NVDate"
  s.version      = "0.0.1"
  s.summary      = "Make NSDate manipulation goes easier"
  s.description  = <<-DESC
                     **NVDate** is library for handling `NSDate` manipulation in iOS Development.
                     DESC
  s.homepage     = "http://novalagung.com/NVDate"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Noval Agung Prayogo" => "caknopal@gmail.com" }
  s.source       = { :git => "https://github.com/novalagung/NVDate.git", :commit => "7d3b87f5b7697e313149d9a5b6bc0bb0d4803b3a" }
  s.source_files = 'NVDate.{h,m}'
end

