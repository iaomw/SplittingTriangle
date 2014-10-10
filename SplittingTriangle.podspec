Pod::Spec.new do |s|

	s.name				= 'SplittingTriangle'
	s.version			= '1.0'
	s.summary			= 'A simple loading style animation.'
	s.homepage			= 'https://github.com/iaomw/SplittingTriangle'
	s.license			= 'MIT'

	s.author			= { 'Sandy Lee' => 'iaomw@live.com' }

	s.source			= { :git => 'https://github.com/iaomw/SplittingTriangle.git', :tag => s.version.to_s }
	s.platform			= :ios, '7.0'	
	s.source_files			= 'SplittingTriangle/SplittingTriangle.*'
	s.frameworks			= 'QuartzCore', 'CoreGraphics'
	s.requires_arc			= true

end
