import UIKit

class UsersViewController: UITableViewController {
    var filteredUsers = [String]()
    var users = ["Jennifer", "Peter", "Ramon", "Joshua", "Michael"]

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Users"
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add, primaryAction: UIAction(handler: { action in
            print("ADD!")
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
        var username: String
        
        if isFiltering {
            username = filteredUsers[indexPath.row]
        } else {
            username = users[indexPath.row]
        }
        
        cell.textLabel?.text = username
        return cell
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredUsers = users.filter { (user: String) -> Bool in
            return user.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
    }
}

extension UsersViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text ?? "")
    }
}
