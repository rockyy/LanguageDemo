//
//  ViewController.swift
//  LanguageDemo
//
//  Created by Rakesh Kumar on 01/04/19.
//  Copyright © 2019 Rakesh Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // getting text from localizable.string file on base on selected language and setting it to label text.
        textLabel.text = RKLocalizedString(key: "How to change the language inside of the app.", comment: "")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier, identifier == "settingsSegue" else{
            return
        }
        if let controller = segue.destination as? SettingsViewController{
            controller.delegate = self
        }
    }
}
extension ViewController : LanguageSelectionDelegate{
    
    func settingsViewController(_ settingsViewController: SettingsViewController, didSelectLanguage language: Language) {

//  Set selected language to application language
        RKLocalization.sharedInstance.setLanguage(language: language.languageCode)
        
//  Reload application bundle as new selected language
        DispatchQueue.main.async(execute: {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.initRootView()
        })
    }
}
