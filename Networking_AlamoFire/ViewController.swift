//
//  ViewController.swift
//  Networking_AlamoFire
//
//  Created by Zhora Babakhanyan on 8/15/22.
//

import UIKit
import Alamofire

final class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    private let url = "https://jsonplaceholder.typicode.com/photos"
    
    private var photos: [Photo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.tableView.register(UINib(nibName: "PhotosTableViewCell", bundle: nil),
                                             forCellReuseIdentifier: "PhotosTableViewCell")
        self.fetchData()
    }
    
    private func fetchData(){
        AF.request(self.url, method: .get).responseDecodable(of: [Photo].self) { [weak self] response in
            self?.photos = response.value ?? []
            self?.tableView.reloadData()
        }
    }

}


// MARK: - Table View Delegate and Data Source

extension ViewController: UITableViewDelegate,UITableViewDataSource {
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath) as? PhotosTableViewCell {

            cell.photo = self.photos[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}
