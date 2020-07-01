Pod::Spec.new do |s|
  s.name = 'MRGRoundButton'
  s.version = '1.1'
  s.summary = 'An highly customizable circle button.'
  s.homepage = 'https://github.com/Mirego/MRGRoundButton'
  s.license = 'BSD 3-Clause'
  s.authors = { 'Mirego, Inc.' => 'info@mirego.com' }
  s.source = { :git => 'https://github.com/Mirego/MRGRoundButton.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Mirego'

  s.ios.deployment_target = '9.0'

  s.requires_arc = true
  s.source_files = 'Pod/Classes'
end
