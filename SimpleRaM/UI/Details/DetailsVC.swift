//
//  DetailsVC.swift
//  SimpleRaM
//
//  Created by Hakan Adanur on 27.11.2022.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    private var name: String!
    private var viewModel: DetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
    }

    @IBAction func closeButtonClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension DetailsVC {
    static func create(name: String) -> DetailsVC {
        let Vc = DetailsVC(nibName: "DetailsVC", bundle: nil)
        Vc.name = name
        Vc.viewModel = DetailsViewModel()
        return Vc
    }
}
