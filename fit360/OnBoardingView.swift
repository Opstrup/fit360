import UIKit

class OnBoardingViewController: UIPageViewController, /*UIPageViewControllerDelegate, */UIPageViewControllerDataSource {
    
    private(set) lazy var onBoardingViewControllers: [UIViewController] = {
        return [CreatUserOnBoardingViewController(),
                SetUpProfileOnBoardingViewController(),
                CreatUserOnBoardingViewController()]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        if let firstViewController = onBoardingViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }

    override init(transitionStyle style: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: options)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = onBoardingViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard onBoardingViewControllers.count > previousIndex else {
            return nil
        }
        
        return onBoardingViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = onBoardingViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = onBoardingViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return onBoardingViewControllers[nextIndex]
    }
}

class SetUpProfileOnBoardingViewController: UIViewController {
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Create profile"
        view.backgroundColor = UIColor.blue
        initUI()
        
    }
    
    // MARK: Init UI
    
    func initUI() {
        
    }
}

class CreatUserOnBoardingViewController: UIViewController {

    // MARK: Private variables
    
    private var header = UILabel()
    private var emailInputField = F360UITextFieldComponent()
    private var passwordInputField = F360UITextFieldComponent()
    private var advanceButton = F360UIButtonComponent()
    private let networkHelper = NetworkHelper.sharedInstance()

    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "On Boarding"
        view.backgroundColor = UIColor.white
        initUI()

    }

    // MARK: Init UI
    
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

        advanceButton = F360UIButtonComponent(x: view.frame.width * 0.1, y: view.frame.height * 0.80, width: view.frame.width * 0.8, height: 40, title: "New User")
        advanceButton.button.addTarget(self, action: #selector(self.newUserPressed(sender:)), for: .touchUpInside)
        view.addSubview(advanceButton.button)
    }

    // MARK: Actions
    
    func newUserPressed(sender: UIButton!) {
        
        // Validate email and password field
        
        if (emailInputField.textField.text?.isEmpty == false &&
            passwordInputField.textField.text?.isEmpty == false)
        {
            createUser()
        }
    }
    
    // MARK: Create user
    
    private func createUser() {
        print("The text fields is not empty!")
        
        /* 1. Set the parameters */

        
        /* 2. Build the URL, Configure the request */
        var request = URLRequest(url: URL.init(string: Network.ApiScheme + Network.ApiHost + Methods.User)!)
        let HTTPHeaderField_ContentType         = "Content-Type"
        let ContentType_ApplicationJson         = "application/json"
        let HTTPMethod_POST                     = "POST"
        
        request.timeoutInterval = 60.0 // TimeoutInterval in Second
        request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
        request.addValue(ContentType_ApplicationJson, forHTTPHeaderField: HTTPHeaderField_ContentType)
        request.httpMethod = HTTPMethod_POST
        
        /* 3. Make the request */
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            /* 4. Some guard clauses for security */
            guard (error == nil) else {
                print("There was an error with the request")
                return
            }
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 200 else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode
                print("The status code was \(statusCode)")
                print("The status code was not in the 2xx range!")
                return
            }
            
            guard let data = data else {
                print("No data was returned by the request!")
                return
            }
            
            /* 5. Parse the data */
            let parsedResult: [String:AnyObject]!
            do {
                parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments)  as! [String:AnyObject]
            } catch {
                print("Something went wrong!")
                return
            }
        
            /* 6. Use the data */
            print(parsedResult["status"] as! String)
        }
        
        /* 7. Start the request */
        task.resume()
    }
}
