import UIKit

class UsersViewController: UITableViewController {
    var filteredUsers = [User]()
    var users = User.generateRandom()

    var searchTask: DispatchWorkItem?

    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        return searchController
    }()
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }

    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    var isSearching: Bool = false {
        didSet {
            if isSearching {
                // show loading
            } else {
                // remove loading
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Users"
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add, primaryAction: UIAction(handler: { action in
            let userCreateViewController = UserCreateViewController(nibName: nil, bundle: nil)
            userCreateViewController.delegate = self
            let navigationController = UINavigationController(rootViewController: userCreateViewController)
            self.present(navigationController, animated: true)
        }))
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredUsers.count
        }
        
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let user: User
        if isFiltering {
            user = filteredUsers[indexPath.row]
        } else {
            user = users[indexPath.row]
        }
        
        cell.textLabel?.text = user.name + " " + user.surname

        return cell
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredUsers = users.filter { (user: User) -> Bool in
            let fullName = user.name + " " + user.surname
            return fullName.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
    }
}

extension UsersViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        self.searchTask?.cancel()

        let task = DispatchWorkItem { [weak self] in
            self?.filterContentForSearchText(searchController.searchBar.text ?? "")
        }
        self.searchTask = task

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: task)
    }
}

extension UsersViewController: UserCreateViewControllerDelegate {
    func userCreateViewController(_ userCreateViewController: UserCreateViewController, didCreateUser user: User) {
        users.append(user)
        tableView.reloadData()
    }
}
