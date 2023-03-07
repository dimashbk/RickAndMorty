
import Foundation
import UIKit

final class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
   
    
    var coordinatorDelegate: TabBarCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .white
        self.delegate = self
    }

}
