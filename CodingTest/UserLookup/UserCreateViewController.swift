import UIKit

protocol UserCreateViewControllerDelegate: AnyObject {
    func userCreateViewController(_ userCreateViewController: UserCreateViewController, didCreateUser user: User)
}

class UserCreateViewController: UIViewController {
    weak var delegate: UserCreateViewControllerDelegate?

    lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name"
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect

        return textField
    }()
    
    lazy var surnameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Surname"
        return label
    }()
    
    lazy var surnameTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect

        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Create user"
        navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .cancel, primaryAction: UIAction(handler: { _ in
            self.dismiss(animated: true)
        }))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .done, primaryAction: UIAction(handler: { [self] _ in
            guard let name = self.nameTextField.text else { return }
            guard let surname = self.nameTextField.text else { return }
            let user = User(name: name, surname: surname)
            self.delegate?.userCreateViewController(self, didCreateUser: user)
            self.dismiss(animated: true)
        }))

        view.backgroundColor = .white
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(surnameLabel)
        view.addSubview(surnameTextField)

        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            
            nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            nameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            nameTextField.heightAnchor.constraint(equalToConstant: 45),
            
            surnameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            surnameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            surnameLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 32),

            surnameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            surnameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            surnameTextField.topAnchor.constraint(equalTo: surnameLabel.bottomAnchor, constant: 16),
            surnameTextField.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}
