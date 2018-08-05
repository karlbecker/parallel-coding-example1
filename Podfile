# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

use_frameworks!

def testing_pods
    pod 'Quick'
    pod 'Nimble'
end

target 'ParallelCodingExample1' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  
  # Pods for ParallelCodingExample1

  target 'ParallelCodingExample1Tests' do
    inherit! :search_paths
    testing_pods
  end

  target 'ParallelCodingExample1UITests' do
    inherit! :search_paths
    # Pods for testing
  end

end


post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        if config.name == 'Release'
            config.build_settings['SWIFT_COMPILATION_MODE'] = 'wholemodule'
        end
    end
end
