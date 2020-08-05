

Pod::Spec.new do |s|


s.name         = "QTTableVIewPlaceholder"
s.version      = "0.1"
s.summary      = "QTTableVIewPlaceholder"


s.description  = "QTTableVIewPlaceholder"

s.homepage     = "https://github.com/HelloBie/QTTableVIewPlaceholder.git"

s.license      = "MIT"

s.author             = { "不不不紧张" => "1005903848@qq.com" }

s.source       = { :git => "https://github.com/HelloBie/QTTableVIewPlaceholder.git", :tag => "#{s.version}" }


s.ios.frameworks = 'Foundation'

s.platform     = :ios, "8.0"

s.source_files  = 'QTTableVIewPlaceholder/QTTableVIewPlaceholder/QTTableVIewPlaceholder/*'

end
