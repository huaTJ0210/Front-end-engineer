import Foundation
import UIKit

public class ViewController1:UIViewController  {
    public override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("打开页面", for: .normal)
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        view.addSubview(button)
        view.backgroundColor = .white
        
    }
    @objc func buttonClick() -> Void {
        let vc = ViewController2()
        navigationController?.pushViewController(vc, animated: true)
    }
}
