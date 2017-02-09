import UIKit

class F360UITextFieldComponent {
    
    private var _field = UITextField()
    
    var textField: UITextField {
        get { return _field }
    }

    init() {

    }

    init(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, placeholder: String) {
        _field = UITextField(frame: CGRect(x: x, y: y, width: width, height: height ))
        _field.backgroundColor = UIColor.cyan
        _field.placeholder = placeholder
        _field.textAlignment = NSTextAlignment.center
        _field.keyboardType = UIKeyboardType.emailAddress
        _field.keyboardAppearance = UIKeyboardAppearance.default
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
