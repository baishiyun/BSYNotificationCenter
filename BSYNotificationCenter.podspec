Pod::Spec.new do |s|
  s.name         = "BSYNotificationCenter" 
  s.version      = "1.0.0"     
  s.license      = "MIT"       
  s.summary      = "BSYNotificationCenter是对通知的简单封装，开发者不用再去关注移除这些问题，在方法中注册成功/接受成功后直接删除."
  s.homepage     = "https://github.com/baishiyun/BSYNotificationCenter" # 你的主页
  s.source       = { :git => "https://github.com/baishiyun/BSYNotificationCenter.git", :tag => "#{s.version}" }
  s.source_files = "BSYNotificationCenter/*.{h,m}"
  s.requires_arc = true 
  s.platform     = :ios, "7.0" 
  s.frameworks = "Foundation","UIKit"
  s.author             = { "白仕云" => "baishiyun@163.com" } 
  s.social_media_url   = "https://github.com/baishiyun" 

end