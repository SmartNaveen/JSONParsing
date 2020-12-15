//
//  ViewController.swift
//  JSON
//
//  Created by Mr. Naveen Kumar on 15/12/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var model: Model?
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJSON()
        
    }

    func parseJSON() {
        guard let path = Bundle.main.path(forResource: "Data", ofType: "json") else {
            return print("Error: ")
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            let dataJSON = try Data(contentsOf: url)
            let jsonDecorder = JSONDecoder()
            model = try jsonDecorder.decode(Model.self, from: dataJSON)
            
            print(model!.Data)
        }catch {
            print("error")
        }
        
        
    }
    
    
}

 // MARK:- Tableview Method
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return (model?.Data.count)!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return model?.Data[section].title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model!.Data[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = model?.Data[indexPath.section].items[indexPath.item]
        
        return cell
    }
    
   
    
}
