//
//  AddBookTableViewController.swift
//  LibraryApp
//
//  Created by Kendall Poindexter on 9/9/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import UIKit

protocol AddBookTableViewControllerDelegate: class {
    
    func addBookTableViewControllerDidCancel( _ controller: AddBookTableViewController)
    
    func addBookTableViewController(_ controller: AddBookTableViewController, didFinishAdding book: Book)
}

class AddBookTableViewController: UITableViewController {
    
    //MARK: - Properties
    
    weak var delegate: AddBookTableViewControllerDelegate?
    
    //MARK: - Outlets
    
    @IBOutlet weak var titleInput: UITextField!
    @IBOutlet weak var authorInput: UITextField!
    
    
    
    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleInput.becomeFirstResponder()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // A protocol that allows static cells to appear when app is run
    //Why?
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return  nil
    }
    
    //MARK: - Actions

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        delegate?.addBookTableViewControllerDidCancel(self)
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        var book = Book()
        
       
        book.title = titleInput.text!
        book.author = authorInput.text!
        
        delegate?.addBookTableViewController(self, didFinishAdding: book)
        
    }
    
}

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


