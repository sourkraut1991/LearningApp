//
//  ContentModel.swift
//  LearningApp
//
//  Created by Christopher Ching on 2021-03-03.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    // Current Module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    var styleData: Data?
    
    init() {
        getLocalData()
    }
    // MARK: Data Methods
    
    func getLocalData() {
        
        // Get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        // Read the file into a data object
        do {
            let jsonData = try Data(contentsOf: jsonUrl!)
            //Try to decode the json into an array of modules
            let JsonDecoder = JSONDecoder()
            let modules = try JsonDecoder.decode([Module].self, from: jsonData)
            //Assign parsed modules to modules property
            self.modules = modules
        }
        catch {
            // TODO log error
            print("Couldn't parse local data")
        }
        
        // Parse the style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        do {
            // Read the file into a data object
            let styleData = try Data(contentsOf: styleUrl!)
            self.styleData = styleData
        }
        catch {
            // Log Error
            print("Couldn't parse style data")
        }
    }
    //MARK: Module Navigation Methods
    func beginModule(_ moduleid:Int) {
        //Find the index for this module ID
        for index in 0..<modules.count {
            if modules[index].id == moduleid {
                //Found the matching module
                currentModuleIndex = index
                break
            }
        }
        // Set the current module
        currentModule = modules[currentModuleIndex]
    }
    
}
