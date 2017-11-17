//
//  ViewController.swift
//  CoreDataSample
//
//  Created by Umesh Chauhan on 14/11/17.
//  Copyright © 2017 Nitin Bhatia. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var data = [["fName":"abc","age":12,"gender":"m"],["fName":"abc 21","age":12,"gender":"f"],["fName":"abc 45","age":12,"gender":"m"] ]
    var people : [NSManagedObject] = []
    @IBOutlet weak var btnFetch: UIButton!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnFetch.addTarget(self, action: #selector(fetchData), for: .touchUpInside)
        btnSave.addTarget(self, action: #selector(saveData), for: .touchUpInside)
        btnDelete.addTarget(self, action: #selector(deleteData), for: .touchUpInside)
        tblView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.data = people[indexPath.row] as! Person
       cell.imageView?.contentMode = .scaleToFill
        if let x = people[indexPath.row].value(forKey: "image") as? UIImage {
            
            cell.imageView?.image = resizeImage(image: x, toTheSize: CGSize(width:50,height:50))
            
        } else {
            cell.imageView?.image = resizeImage(image: #imageLiteral(resourceName: "gender_neutral_user1600"), toTheSize: CGSize(width:50,height:50))
            
        }
        cell.textLabel?.text = people[indexPath.row].value(forKey: "fName") as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func resizeImage(image:UIImage, toTheSize size:CGSize)->UIImage{
        
        let scale = CGFloat(max(size.width/image.size.width,
                                size.height/image.size.height))
        let width:CGFloat  = image.size.width * scale
        let height:CGFloat = image.size.height * scale;
        
        let rr:CGRect = CGRect(x: 0, y: 0, width: width, height: height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0);
        image.draw(in: rr)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return newImage!
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sender = sender as? TableViewCell
        let vc = segue.destination as! DetailViewController
        vc.data = sender?.data
    }
    
   
    
   
    
    @objc func fetchData(){
        //1
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Person")
        
        //3
        do {
            people = try managedContext.fetch(fetchRequest)
            tblView.reloadData()
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    @objc func deleteData(){
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest =
            NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        let result = try? managedContext.fetch(fetchRequest)
        let resultData = result as! [Person]

        // 3
        
        for i in resultData{
            managedContext.delete(i)
            
            // 4
            do {
                try managedContext.save()
                // people.append(person)
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
        fetchData()
    }

    
    @objc func saveData(){
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: "Person",
                                       in: managedContext)!
        
        
        
        // 3
        
        for i in data{
            let person = NSManagedObject(entity: entity,
                                         insertInto: managedContext)
            person.setValuesForKeys(i)
        
            // 4
            do {
                try managedContext.save()
                // people.append(person)
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }

}

