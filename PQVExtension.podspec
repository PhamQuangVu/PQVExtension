Pod::Spec.new do |spec|


  spec.name         = "PQVExtension"
  spec.version      = "1.0.0"
  spec.summary      = "A collection of extension used throughout many projects"


  spec.homepage     = "https://github.com/PhamQuangVu/"


  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "Vu" => "vuphamquang1989@gmail.com" }

  spec.ios.deployment_target = '8.0'
  spec.description = "This framework contains many extensions collected through projects. It can help you create view controller, table view, collection view easier without repeating codes"

  spec.source       = { :git => "https://github.com/PhamQuangVu/PQVExtension.git", :tag => spec.version.to_s }
  spec.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0', 'HEADER_SEARCH_PATHS' => '$(PODS_ROOT)'}
  spec.source_files  = 'PQVExtension/*.{swift}'
  spec.swift_version = '5'

end
