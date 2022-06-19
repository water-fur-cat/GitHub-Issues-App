//
//  OpenIssueViewController.swift
//  homework3
//
//  Created by 周越 on 1/31/22.
//

import UIKit

class OpenIssueViewController: UITableViewController {
    
    var issues_array2 = [GithubIssue]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Did called!")
        
        GitHubClient.fetchIssues(state:"open", completion: {(issues, error) in
            guard let issues = issues, error == nil else {
                print(error!)
                return
            }
            for issue in issues {
                self.issues_array2.append(issue)
//                print("""
//                  ✔️ \(issue.title)
//                  Body: \(issue.body)
//                  Date: \(issue.createdAt)
//
//                  """)
            // Parse the data in issues to extract the information needed
            }
            self.tableView.reloadData()
        })
        
        let refreshControl = UIRefreshControl()
        let title = NSAttributedString(string: "Pull to Refresh 🤪")
        refreshControl.attributedTitle = title
        refreshControl.addTarget(self,
                                 action: #selector(refresh(sender:)),
                                 for: .valueChanged)
        self.tableView.refreshControl = refreshControl
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @objc func refresh(sender: UIRefreshControl) {
        GitHubClient.fetchIssues(state:"open", completion: {(issues, error) in
            guard let issues = issues, error == nil else {
                print(error!)
                return
            }
            for issue in issues {
                self.issues_array2.append(issue)
//                print("""
//                  ✔️ \(issue.title)
//                  Body: \(issue.body)
//                  Date: \(issue.createdAt)
//
//                  """)
            // Parse the data in issues to extract the information needed
            }
            self.tableView.reloadData()
        })
        print("done refreshing")
        sender.endRefreshing()
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return issues_array2.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! IssueTableViewCell

        // Configure the cell...
        cell.leftCell.text = issues_array2[indexPath.row].title
        cell.rightCell.text = "@\(issues_array2[indexPath.row].user.login)"
        
        // not show
        let imageObject = UIImage(named: "icon.jpeg")
        cell.picture.image = imageObject
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow = indexPath.row
//        self.performSegue(withIdentifier: "openDetail", sender: self)
        print("Tapped: \(selectedRow)")
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.systemPink
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let detailsVC = segue.destination as! IssueDetailViewController
        detailsVC.data = issues_array2[self.tableView.indexPathForSelectedRow!.row]
        print("Must be my modal")
    }
    

}
