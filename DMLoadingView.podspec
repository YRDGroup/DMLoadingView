Pod::Spec.new do |s|
  s.name         = 'DMLoadingView'
  s.version      = '1.0.2'
  s.summary      = '拆分贷嘛工具类'
  s.homepage     = 'https://github.com/YRDGroup/DMLoadingView'
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { 'Agoer' => '10915819@qq.com' }
  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source       = {
      :git => 'https://github.com/YRDGroup/DMLoadingView.git',
      :tag => s.version.to_s
  }
  s.source_files = 'DMLoadingView/**/*.{c,h,m}'
end