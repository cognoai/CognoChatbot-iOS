Pod::Spec.new do |spec|

  spec.name         = "Exo-CognoChatbot-iOS"
  spec.version      = "7.0.1"
  spec.summary      = "Simple chatbot SDK"
  spec.description  = "Chatbot SDK/ Framework ready to available with all types of iOS applications"
  spec.homepage     = "https://github.com/cognoai/CognoChatbot-iOS.git"
  spec.license      = "MIT"
  spec.author       = { "Kusal Saraf" => "kusal.saraf@exotel.com" }
  spec.platform     = :ios, "11.0"
  spec.source       = { :git => "https://github.com/cognoai/CognoChatbot-iOS.git", :tag => spec.version.to_s }
  spec.source_files  = "CognoChatbot-iOS/**/*.swift"

end
