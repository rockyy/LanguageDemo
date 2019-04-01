//
//  Language.swift
//  LanguageDemo
//
//  Created by Rakesh Kumar on 01/04/19.
//  Copyright © 2019 Rakesh Kumar. All rights reserved.
//

import UIKit

class Language: NSObject {
    
    open var languageCode    : String
    open var language : String
    
    open static var emptyLanguage    : Language { return Language(languageCode: "", language: "") }
    
    
    
//     Constructor to initialize a country
//
//     - Parameters:
//     - countryCode: the country code
    public init(languageCode: String, language: String) {
        
        self.languageCode = languageCode
        self.language = language
        
    }
    
    open override var description: String{
        return self.languageCode + " " + self.language
    }
}
