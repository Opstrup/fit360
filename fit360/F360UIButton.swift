import UIKit

class F360UIButtonComponent {

    private var _button = UIButton()

    var button: UIButton {
        get { return _button }
    }

    init() {

    }

    init(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, title: String) {
        _button = UIButton(frame: CGRect(x: x, y: y, width: width, height: height ))
        _button.setTitle(title, for: UIControlState.normal)
        _button.backgroundColor = UIColor.green
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}