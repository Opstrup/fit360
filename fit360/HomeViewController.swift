import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        view.backgroundColor = UIColor.white

        setUI()
    }
    
    func setUI() {
        let header = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.4))
        header.text = "fit360"
        header.backgroundColor = UIColor.lightGray
        header.font = header.font.withSize(24.0)
        view.addSubview(header)
        
        let emailInput2 = F360UITextFieldComponent(x: view.frame.width * 0.1, y: view.frame.height * 0.5, width: view.frame.width * 0.8, height: 40, placeholder: "email")
        view.addSubview(emailInput2.textField)
        
        let passwordInput = F360UITextFieldComponent(x: view.frame.width * 0.1, y: view.frame.height * 0.5 + 60, width: view.frame.width * 0.8, height: 40, placeholder: "password")
        view.addSubview(passwordInput.textField)
        
        let advanceBtn = UIButton(frame: CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.80, width: view.frame.width * 0.8, height: 40))
        advanceBtn.setTitle("Advance", for: UIControlState.normal)
        advanceBtn.backgroundColor = UIColor.green
        advanceBtn.addTarget(self, action: #selector(HomeViewController.hello(sender:)), for: .touchUpInside)
        view.addSubview(advanceBtn)
        
        // Draw circles
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 100, y: view.frame.height * 0.95), radius: CGFloat(3), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        //change the fill color
        shapeLayer.fillColor = UIColor.clear.cgColor
        //you can change the stroke color
        shapeLayer.strokeColor = UIColor.black.cgColor
        //you can change the line width
        shapeLayer.lineWidth = 2.0
        
        view.layer.addSublayer(shapeLayer)
    }
    
    func hello(sender: UIButton!) {
        NSLog("Hello")
        
    }
}
