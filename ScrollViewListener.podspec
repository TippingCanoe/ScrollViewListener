Pod::Spec.new do |s|

  s.name         = "ScrollViewListener"
  s.version      = "0.1"
  s.summary      = "Block based observing of a UIScrollView's contentOffset."

  s.description  = <<-DESC
                   Block based observing of a UIScrollView's contentOffset
                   DESC

  s.homepage     = "http://tippingcanoe.com"
  s.license      = 'MIT'
  s.author       = { "Sudeep Sidhu" => "s.sidhu@tippingcanoe.com" }
  s.platform     = :ios, '5.0'
  s.source       = { :git => "git@github.com:TippingCanoe/ScrollViewListener.git", :tag => "0.1.0" }
  s.source_files  = 'ScrollViewListener/*.{h,m}'
  s.requires_arc = true

end
