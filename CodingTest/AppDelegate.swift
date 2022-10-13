import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let wordGeneratorViewController = WordGeneratorViewController(nibName: nil, bundle: nil)
        let wordGeneratorNavigationController = UINavigationController(rootViewController: wordGeneratorViewController)
        wordGeneratorNavigationController.tabBarItem = UITabBarItem(title: "Word Generator", image: nil, tag: 0)

        let usersViewController = UsersViewController(nibName: nil, bundle: nil)
        let usersNavigationController = UINavigationController(rootViewController: usersViewController)
        usersNavigationController.tabBarItem = UITabBarItem(title: "Users", image: nil, tag: 1)

        let calendarViewController = CalendarViewController(nibName: nil, bundle: nil)
        let calendarNavigationController = UINavigationController(rootViewController: calendarViewController)
        calendarNavigationController.tabBarItem = UITabBarItem(title: "Calendar", image: nil, tag: 2)

        let tabBarController = UITabBarController(nibName: nil, bundle: nil)
        tabBarController.viewControllers = [calendarNavigationController, usersNavigationController, wordGeneratorNavigationController]
        
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
        return true
    }
}
