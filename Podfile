minDeploymentTarget = '11.0'

platform :ios, minDeploymentTarget

# Use frameworks
use_frameworks!

# Custom configurations
project 'MyLovcen', 'ProductionDebug' => :debug, 'ProductionRelease' => :release, 'DevelopmentDebug' => :debug, 'DevelopmentRelease' => :release

# Pods
def ui
  pod 'MBProgressHUD'
end

def reactive
  pod 'RxSwift'
  pod 'RxCocoa'
end

def networking
  pod 'Alamofire'
  pod 'AlamofireImage', '~> 4.1'
end

def testing
  pod 'RxTest'
end

def shared
  ui
  reactive
  networking
end

target 'MyLovcen' do
    shared

    target 'MyLovcenTests' do
      inherit! :search_paths
      testing
    end

    target 'MyLovcenUITests' do
      inherit! :search_paths
      testing
    end
end
