
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var dailyTasks = [
        Task(name: "Dailycheck 1", type: .daily, completd: false, lastCompleted: nil),
        Task(name: "Dailycheck 2", type: .daily, completd: true, lastCompleted: nil),
        Task(name: "Dailycheck 3", type: .daily, completd: false, lastCompleted: nil),
        Task(name: "Dailycheck 4", type: .daily, completd: false, lastCompleted: nil)
    ]
    
    var weeklyTask = [
        Task(name: "WeeklyCheck 1", type: .weekly, completd: false, lastCompleted: nil),
        Task(name: "WeeklyCheck 2", type: .weekly, completd: false, lastCompleted: nil),
        Task(name: "WeeklyCheck 3", type: .weekly, completd: false, lastCompleted: nil)
    ]
    var mounthTasks = [
        Task(name: "MonthlyCheck 1", type: .monthly, completd: false, lastCompleted: nil),
        Task(name: "MonthlyCheck 2", type: .monthly, completd: false, lastCompleted: nil),
        Task(name: "MonthlyCheck 3", type: .monthly, completd: false, lastCompleted: nil),
        Task(name: "MonthlyCheck 4", type: .monthly, completd: false, lastCompleted: nil),
        Task(name: "MonthlyCheck 1", type: .monthly, completd: false, lastCompleted: nil)
    ]
    
    
    @IBOutlet weak var taskTableView: UITableView!
    
    //Table view Delegate methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //behaver
    }
    
    
    
    //swipe action on task to complete the task
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let completeAction = UIContextualAction(style: .normal, title: "Complete") {
            (action:UIContextualAction,
            sourceView:UIView,
            actionPerformed:(Bool) -> Void) in
            
            switch indexPath.section{
                case 0:
                    self.dailyTasks[indexPath.row].completd=true
                case 1:
                    self.weeklyTask[indexPath.row].completd=true
                case 2:
                    self.mounthTasks[indexPath.row].completd=true
                default:
                    break
            }
            tableView.reloadData()
            
            actionPerformed(true)
        }
        return UISwipeActionsConfiguration(actions: [completeAction])
    }
    
    
    //Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        tableView.backgroundColor = UIColor.clear
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return dailyTasks.count
        case 1:
            return weeklyTask.count
        case 2:
            return mounthTasks.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        //hold the current task
        var currentTask : Task!
        
        switch indexPath.section{
        case 0:
            currentTask = dailyTasks[indexPath.row]
        case 1:
            currentTask = weeklyTask[indexPath.row]
        case 2:
            currentTask = mounthTasks[indexPath.row]
        default:
            break
        }
        
        if currentTask.completd{
            cell.textLabel?.textColor=UIColor.lightGray
            cell.accessoryType = .checkmark
        }else{
            cell.textLabel?.textColor=UIColor.black
            cell.accessoryType = .none
        }
        
        //use the name property to set the value of the cell
        cell.textLabel!.text = currentTask.name
        cell.backgroundColor = UIColor.clear

        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Daily Tasks"
        case 1:
            return "Weekly Tasks"
        case 2:
            return "Mounthly Tasks"
        default:
            return nil
        }
    }

    
    @IBAction func resetList(_ sender: Any) {
        let confirm = UIAlertController(title: "Are you sure?", message: "Really reset th list?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .destructive){
            ACTION in
            for i in 0..<self.dailyTasks.count{
                       self.dailyTasks[i].completd = false
                   }
                   for i in 0..<self.weeklyTask.count{
                       self.weeklyTask[i].completd=false
                   }
                   for i in 0..<self.mounthTasks.count{
                       self.mounthTasks[i].completd=false
                   }
                   
            self.taskTableView.reloadData()
        }
        
        let noAction = UIAlertAction(title: "No", style: .cancel){
            ACTION in
            print("that was close one!")
        }
        
        //add action to allert contoler
        confirm.addAction(yesAction)
        confirm.addAction(noAction)
        
        present(confirm,animated: true, completion: nil)
        
       
    }
    
    // Create Dark mode by clicking a button
    @IBAction func toggleDarkMode(_ sender: Any) {
        let toolbarSwitch = sender as! UISwitch
        
        if toolbarSwitch.isOn{
            view.backgroundColor = UIColor.darkGray
        }else{
            view.backgroundColor = UIColor.white
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

