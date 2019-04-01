//
//  RKLocalization.swift
//  LanguageDemo
//
//  Created by Rakesh Kumar on 01/04/19.
//  Copyright © 2019 Rakesh Kumar. All rights reserved.
//

import UIKit

enum LanguageDirection : Int {
    case leftToRight = 1
    case rightToLeft = 2
}

class RKLocalization: NSObject {
    static let sharedInstance = RKLocalization()
    var bundle: Bundle? = nil
    var languageDirection = LanguageDirection(rawValue: 1)
    
    // Get direction of language
    func getlanguageDirection() -> LanguageDirection {
        if languageDirection?.rawValue == 0 {
            return .leftToRight
        }else if getLanguage() == "ar" {
            return .rightToLeft
        }else{
            return .leftToRight
        }
    }
    
    // get localizedString from bundle of selected language
    func localizedString(forKey key: String, value comment: String) -> String {
        let localozed = bundle!.localizedString(forKey: key, value: comment, table: nil)
        return localozed
    }
    
    // set language for localization
    func setLanguage(language: String) -> Void {
        var selectedLanguage = language
        if language.count == 0 {
            selectedLanguage = "en"
        }
        UserDefaults.standard.set(selectedLanguage, forKey: "kLanguage")
        UserDefaults.standard.synchronize()
        let path: String? = Bundle.main.path(forResource: selectedLanguage, ofType: "lproj")
        if path == nil {
            //in case the language does not exists
            resetLocalization()
        }
        else {
            bundle = Bundle(path: path!)
        }
    }
    
    // reset bundle
    func resetLocalization() {
        bundle = Bundle.main
    }
    
    // get selected language from UserDefaults
    func getLanguage() -> String? {
        if let language = UserDefaults.standard.string(forKey: "kLanguage"){
            return language
        }
        return nil
    }
    
    // get and load bundle on basis of selected language
    func languageSelectedString(forKey key: String) -> String {
        var path: String
        if (getLanguage() == "en") {
            path = Bundle.main.path(forResource: "en", ofType: "lproj")!
        }
        else if (getLanguage() == "zh-Hans") {
            path = Bundle.main.path(forResource: "zh-Hans", ofType: "lproj")!
        }
        else if (getLanguage() == "fr") {
            path = Bundle.main.path(forResource: "fr", ofType: "lproj")!
        }
        else {
            path = Bundle.main.path(forResource: "en", ofType: "lproj")!
        }
        
        let languageBundle = Bundle(path: path)
        let languageBundleString = languageBundle?.localizedString(forKey: key, value: "", table: nil)        
        return languageBundleString!
    }
}

// LocalizedString to get string in selected language
func RKLocalizedString(key: Any, comment: Any) -> String {
    return RKLocalization.sharedInstance.localizedString(forKey: (key as! String), value: (comment as! String))
}


