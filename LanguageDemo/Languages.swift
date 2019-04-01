//
//  Languages.swift
//  LanguageDemo
//
//  Created by Rakesh Kumar on 01/04/19.
//  Copyright © 2019 Rakesh Kumar. All rights reserved.
//

import UIKit

class Languages: NSObject {
    
    /// Language code to show in application to choese
    fileprivate(set) static var languages: [Language] = {
        
        var languages: [Language] = []
        languages.append(Language(languageCode: "en", language: "English"))
        languages.append(Language(languageCode: "fr", language: "French"))
        languages.append(Language(languageCode: "zh-Hans", language: "Chinese Simplified"))
        
        
        return languages
    }()

    // Find a Language Available for Application or not
    //
    // - Parameter code: Language code, exe. en
    // - Returns: true/false
    class func isLanguageAvailable(_ code: String) -> Bool {
        for language in languages {
            if  code == language.languageCode {
                return true
            }
        }
        return false
    }

    // Find a Language based on it's Language code
    //
    // - Parameter code: Language code, exe. en
    // - Returns: Language
    class func languageFromLanguageCode(_ code: String) -> Language {
        for language in languages {
            if  code == language.languageCode {
                return language
            }
        }
        return Language.emptyLanguage
    }
    // Find a Language based on it's Language Name
    //
    // - Parameter languageName: languageName, exe. english
    // - Returns: Language
    class func languageFromLanguageName(_ languageName: String) -> Language {
        for language in languages {
            if languageName == language.language {
                return language
            }
        }
        return Language.emptyLanguage
    }
    
}
