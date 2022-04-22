//
//  ViewController.swift
//  UITableViewExample
//
//  Created by Janire Fernandez on 21/4/22.
//

import UIKit

class ViewController: UIViewController {
    
    var viewModel: ViewModel!
    var contacts = [Contact]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModel(getContactsUseCase: GetContactsUseCase(repository: Repository(apiService: ApiService(networkService: NetworkService()))))
        fetchMovies()
        tableView.dataSource = self
        
    }
    
    private func fetchMovies(){
        viewModel.getContacts{ data in
            self.contacts = data
            print(self.contacts)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row].name
        return cell
    }
    
    
    
    
}
