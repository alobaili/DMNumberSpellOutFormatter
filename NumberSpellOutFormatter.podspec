#
# Be sure to run `pod lib lint NumberSpellOutFormatter.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
	s.name						 = 'NumberSpellOutFormatter'
	s.version					 = '1.0.0'
	s.summary					 = 'Spell out numbers in any language'

	s.description			 = <<-DESC
Allows to spell out numbers in different languages and with many options. Unlike the standard NSNumberFormatter it
also supports ordinal numbers with any additional modes that are applicable for specific language, such as gender
(feminine and masculine) and grammatical cases.
											 DESC

	s.homepage				 = 'https://github.com/dimat/DMNumberSpellOutFormatter'
	s.license					 = { :type => 'MIT', :file => 'LICENSE' }
	s.author					 = { 'Dmitry Matyukhin' => 'dimatu@gmail.com' }
	s.source					 = { :git => 'https://github.com/dimat/DMNumberSpellOutFormatter.git', :tag => s.version.to_s }

	s.ios.deployment_target = '8.0'
	s.swift_version = '3.2'

	s.source_files = ['NumberSpellOutFormatter/Classes/**/*']

	s.public_header_files = 'NumberSpellOutFormatter/Classes/*.h'

	s.default_subspec = 'precompiled'

	s.subspec 'precompiled' do |ss|
		ss.source_files = 'icu4c-static-lib/include/**/*.h'
		ss.private_header_files = 'icu4c-static-lib/include/**/*.h'
		ss.vendored_libraries = 'icu4c-static-lib/lib/**/*.a'

#		ss.header_mappings_dir = 'icu4c-static-lib/include'
		ss.libraries = "c++"
			
		# This will prevent warnings about missing architectures
        # ldflags = '-l"c++" -l"icudata" -l"icui18n" -l"icuio" -l"icuuc"'
		ss.pod_target_xcconfig = {
			'ONLY_ACTIVE_ARCH' => 'YES'
		}
	end

	s.test_spec 'Tests' do |test_spec|
		test_spec.source_files = 'NumberSpellOutFormatter/Tests/*.swift'
		test_spec.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.2' }
	end
end
