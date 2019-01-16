//
//  InputOutput.swift
//  pocket-aion
//
//  Created by Pabel Nunez Landestoy on 1/15/19.
//  Copyright © 2019 Pocket Network. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct InputOutput {
    private var name: String
    private var type: String
    
    // Constants
    private static let NAME_KEY = "name";
    private static let TYPE_KEY = "type";
    
    init(name: String, type: String) {
        self.name = name
        self.type = type
    }
    
    public static func fromInputJSONArray(inputArrayJSON: [JSON]) throws -> [InputOutput] {
        var result = [InputOutput]()
        for item in inputArrayJSON {
            guard let itemObjt = item.dictionaryObject else{
                return result
            }
            
            result.append(try InputOutput.fromInputJSONObject(inputObj: itemObjt)!)
        }
        
        return result;
    }
    
    public static func fromInputJSONObject(inputObj: [AnyHashable: Any]) throws -> InputOutput? {
        
        guard let inputName = inputObj[NAME_KEY] as? String else {
            return nil
        }
        
        guard let inputType = inputObj[TYPE_KEY] as? String else {
            return nil
        }

        return InputOutput(name: inputName, type: inputType);
    }
    
    public func getName() -> String {
        return self.name;
    }
    
    public func getType() -> String {
        return self.type;
    }
    
}