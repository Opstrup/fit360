import UIKit

class OnBoardingView: UIViewController {

    override func viewDidLoad() {
        let header = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        header.text = "fit360"
        header.backgroundColor = UIColor.lightGray
        header.font = header.font.withSize(24.0)
        view.addSubview(header)
    }
}
