Pod::Spec.new do |s|
  s.name             = "MRGRoundButton"
  s.version          = "0.2.0"
  s.summary          = "A label with a marquee effect."
  s.homepage         = "https://github.com/Mirego/MRGRoundButton"
  s.license          = 'BSD 3-Clause'
  s.authors          = { 'Mirego, Inc.' => 'info@mirego.com' }
  s.source           = { :git => "https://github.com/Mirego/MRGRoundButton.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Mirego'

  s.platform         = :ios, '7.0'
  s.requires_arc     = true

  s.source_files     = 'Pod/Classes'
  s.dependency 'MCUIImageAdvanced', '~> 1.0'
end
