//
//  SettingsViewController.swift
//  LanguageDemo
//
//  Created by Rakesh Kumar on 01/04/19.
//  Copyright © 2019 Rakesh Kumar. All rights reserved.
//

import UIKit

protocol LanguageSelectionDelegate {
    
   
    // Comunicate delegates that a country has been selected
    //
    //   - Parameters:
    //   - settingsViewController: settingsViewController
    //   - language: selected language
    func settingsViewController(_ settingsViewController: SettingsViewController, didSelectLanguage language: Language)
   
}


class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let languages = Languages.languages
    var delegate : LanguageSelectionDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.tableView.tableFooterView = UIView(frame: .zero);
    }
    
}

// MARK: - Table view data source

extension SettingsViewController : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "languageCell", for: indexPath)
        
        cell.textLabel?.text = languages[indexPath.row].language
        
        return cell
    }
}

// MARK: - Table view delegate
extension SettingsViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedLanguage = self.languages[indexPath.row]        
        delegate?.settingsViewController(self, didSelectLanguage: selectedLanguage)
    }
}
