import UIKit
import CoreData

protocol MainViewDelegate: AnyObject {
    func getItems()
    
}

class MainViewController: UIViewController {
    
    let tableView = UITableView()
    let presenter: MainPresenter

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getItems()
        
        setUpTableViewLayout()
        configureTableView()
        configureNavigationBar()
    }
    //MARK: - Init
    init(presenter: MainPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    } 
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - private methods

    private func setUpTableViewLayout() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func configureTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func configureNavigationBar() {
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .done, target: self, action: #selector(addButtonTapped))
        
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addButtonTapped() {
        showAlert()
    }
    
    
    private func showAlert() {
        let alert = UIAlertController(title: "Write task", message: nil, preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Write down your task"
        }
        
        
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let textField = alert.textFields?.first,
            let text = textField.text, !text.isEmpty else { return }
            
            self.presenter.save(with: text)
//            self.save(with: text)
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        
        present(alert, animated: true)
        
    }
}

//MARK: - Extension

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        let item = presenter.items[indexPath.row]
       
        cell.textLabel?.text = item.value(forKey: "name") as? String
        cell.textLabel?.text = item.name
        
        return cell
    }
}

extension MainViewController: MainViewDelegate {
    func getItems() {
        presenter.getItems()
    }
}


