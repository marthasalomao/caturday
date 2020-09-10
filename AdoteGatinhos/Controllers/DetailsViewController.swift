//
//  DetailsViewController.swift
//  AdoteGatinhos
//
//  Created by Martha R on 09/09/2020.
//  Copyright © 2020 Martha Salomão de Moraes. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var temperamentLabel: UILabel!
    
    // MARK: - Properties
    var cat: Adoption?
    
    // MARK: - Initializers
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(cat: Adoption) {
        super.init(nibName: nil, bundle: nil)
        self.title = cat.name
        self.cat = cat
    }
    
    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let cat = cat else { return }
        prepare(cat: cat)
    }

    // MARK: - Methods
    func prepare(cat: Adoption) {
        catImageView.image = UIImage(named: "\(cat.name).png")
        nameLabel.text = cat.name
        originLabel.text = cat.origin
        temperamentLabel.text = cat.temperament
    }
}
