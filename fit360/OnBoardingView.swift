import UIKit

class OnBoardingView: UIViewController {

    private var header = UILabel()
    private var emailInputField = F360UITextFieldComponent()
    private var passwordInputField = F360UITextFieldComponent()
    private var advanceButton = F360UIButtonComponent()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "On Boarding"
        view.backgroundColor = UIColor.white
        initUI()

    }

    func initUI() {
        header = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.4))
        header.text = "fit360"
        header.backgroundColor = UIColor.lightGray
        header.font = header.font.withSize(24.0)
        view.addSubview(header)

        emailInputField = F360UITextFieldComponent(x: view.frame.width * 0.1, y: view.frame.height * 0.5, width: view.frame.width * 0.8, height: 40, placeholder: "email")
        view.addSubview(emailInputField.textField)

        passwordInputField = F360UITextFieldComponent(x: view.frame.width * 0.1, y: view.frame.height * 0.5 + 60, width: view.frame.width * 0.8, height: 40, placeholder: "password")
        view.addSubview(passwordInputField.textField)

        advanceButton = F360UIButtonComponent(x: view.frame.width * 0.1, y: view.frame.height * 0.80, width: view.frame.width * 0.8, height: 40, title: "Advance")
        advanceButton.button.addTarget(self, action: #selector(self.hello(sender:)), for: .touchUpInside)
        view.addSubview(advanceButton.button)
    }

    func hello(sender: UIButton!) {
        print("The email is: \(emailInputField.textField.text) and the password is: \(passwordInputField.textField.text)")
    }
}
