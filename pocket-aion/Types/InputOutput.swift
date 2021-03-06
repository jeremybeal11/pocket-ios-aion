//
//  InputOutput.swift
//  pocket-aion
//
//  Created by Pabel Nunez Landestoy on 1/15/19.
//  Copyright © 2019 Pocket Network. All rights reserved.
//
// Structs that parses the inputs and outputs of the function JSON ABI

import Foundation
import SwiftyJSON
import enum Pocket.PocketPluginError

public struct InputOutput {
    private var name: String
    private var type: String
    private var json: JSON
    
    // Constants
    private static let NAME_KEY = "name";
    private static let TYPE_KEY = "type";
    
    public init(name: String, type: String, json: JSON) {
        self.name = name
        self.type = type
        self.json = json
    }
    
    public static func fromInputJSONArray(inputArrayJSON: JSON) throws -> [InputOutput] {
        var result = [InputOutput]()
        for item in inputArrayJSON.array! {
            guard let inputOutput = try InputOutput.fromInputJSONObject(inputObj: item) else {
                throw PocketPluginError.Aion.executionError("Failed create inputOutput element from JSON Object")
            }
            result.append(inputOutput)
        }
        
        return result;
    }
    
    public static func fromInputJSONObject(inputObj: JSON) throws -> InputOutput? {
        
        let inputName = inputObj[NAME_KEY].stringValue
        let inputType = inputObj[TYPE_KEY].stringValue
        
        return InputOutput(name: inputName, type: inputType, json: inputObj);
    }
    
    public func getName() -> String {
        return self.name;
    }
    
    public func getType() -> String {
        return self.type;
    }
    
    public func getJSON() -> JSON {
        return self.json
    }
}
