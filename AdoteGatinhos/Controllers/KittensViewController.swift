//
//  KittensViewController.swift
//  AdoteGatinhos
//
//  Created by Martha R on 08/09/2020.
//  Copyright © 2020 Martha Salomão de Moraes. All rights reserved.
//

import UIKit

class KittensViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var adoptions: [Adoption] = []

    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Caturday"
        loadAdoptions()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FeaturesTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "cell")
    }

    // MARK: - Methods
    func loadAdoptions() {
        let fileURL = Bundle.main.url(forResource: "cats.json", withExtension: nil)!
        let jsonData = try! Data(contentsOf: fileURL)
        do {
            adoptions = try JSONDecoder().decode([Adoption].self, from: jsonData)
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension KittensViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adoptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeaturesTableViewCell
        
        let adoption = adoptions[indexPath.row]
        cell.prepare(cat: adoption)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let adoption = adoptions[indexPath.row]
        let details = DetailsViewController(cat: adoption)
        navigationController?.pushViewController(details, animated: true)
    }
}











