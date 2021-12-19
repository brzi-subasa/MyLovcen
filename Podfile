minDeploymentTarget = '11.0'

platform :ios, minDeploymentTarget

# Use frameworks
use_frameworks!

# Custom configurations
project 'PinchAssignment', 'ProductionDebug' => :debug, 'ProductionRelease' => :release, 'DevelopmentDebug' => :debug, 'DevelopmentRelease' => :release

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

target 'PinchAssignment' do
    shared

    target 'PinchAssignmentUITests' do
      inherit! :search_paths
      testing
    end
end
