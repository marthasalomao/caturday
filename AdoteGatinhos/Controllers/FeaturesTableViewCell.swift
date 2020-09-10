//
//  FeaturesTableViewCell.swift
//  AdoteGatinhos
//
//  Created by Martha R on 08/09/2020.
//  Copyright © 2020 Martha Salomão de Moraes. All rights reserved.
//

import UIKit

class FeaturesTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var ivCat: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    
    // MARK: - Methods
    func prepare(cat: Adoption) {
        ivCat.image = UIImage(named: "\(cat.name).png")
        lbTitle.text = cat.name
        subTitle.text = cat.temperament
    }
}
