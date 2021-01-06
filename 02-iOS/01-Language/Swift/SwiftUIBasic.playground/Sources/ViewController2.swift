import Foundation
import UIKit

 public class ViewController2: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.text = "页面2"
        label.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        label.backgroundColor = .red
        label.textColor = .white
        view.addSubview(label)
        view.backgroundColor = .white
    }
    
    
}
