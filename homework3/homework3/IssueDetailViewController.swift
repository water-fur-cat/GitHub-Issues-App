//
//  IssueDetailViewController.swift
//  homework3
//
//  Created by 周越 on 1/31/22.
//

import UIKit

class IssueDetailViewController: UIViewController {
    var data:GithubIssue?
    
    @IBOutlet weak var title_detail: UILabel!
    @IBOutlet weak var user_detail: UILabel!
    @IBOutlet weak var issue_date: UILabel!
    @IBOutlet weak var body_detail: UITextView!
    @IBOutlet weak var pic1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title_detail.text = data?.title
        user_detail.text = data?.user.login
        body_detail.text = data?.body

        let dateFormetter = DateFormatter()
        dateFormetter.locale = Locale(identifier: "en_US")
        dateFormetter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let datetime = dateFormetter.date(from: data!.createdAt)
        issue_date.text = datetime?.formatted(date: .long, time: .omitted)
        if data?.state == "open"{
            let imageObject = UIImage(named: "icon.jpeg")
            pic1.image = imageObject
        }else{
            let imageObject = UIImage(named: "icon2.jpeg")
            pic1.image = imageObject
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
