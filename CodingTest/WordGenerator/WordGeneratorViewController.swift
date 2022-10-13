import UIKit

class WordGeneratorViewController: UIViewController {
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 32.0)
        return label
    }()
    
    lazy var generateButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.title = "Generate"
        let button = UIButton(configuration: configuration, primaryAction: UIAction(handler: { _ in
            self.titleLabel.text = WordGenerator.generate()
        }))
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(generateButton)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            generateButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            generateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])

        self.titleLabel.text = WordGenerator.generate()
    }
}

