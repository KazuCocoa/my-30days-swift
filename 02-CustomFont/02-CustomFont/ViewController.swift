import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let data = ["30 days swif", "やっほー"]

    let fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular"]

    var fontRowIndex = 0

    @IBOutlet weak var changeFontButton: UIButton!
    @IBOutlet weak var fontTableView: UITableView!

    @IBAction func changeFontDidTouch(sender: AnyObject) {
        fontRowIndex = (fontRowIndex + 1) % 3
        fontTableView.reloadData()
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        fontTableView.dataSource = self
        fontTableView.delegate = self

        UIFont.familyNames().forEach { family in
            UIFont.fontNamesForFamilyName(family).forEach { font in
                //print(font)
            }
        }

        changeFontButton.layer.cornerRadius = 55
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = fontTableView.dequeueReusableCellWithIdentifier("FontCell", forIndexPath: indexPath)

        let text = data[indexPath.row]

        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.blackColor()
        cell.textLabel?.font = UIFont(name: self.fontNames[fontRowIndex], size: 16)

        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

}

