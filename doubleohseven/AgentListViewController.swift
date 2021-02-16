//
//  AgentListViewController.swift
//  doubleohseven
//
//  Created by ksd on 10/02/2021.
//

import UIKit

class AgentListViewController: UIViewController {
    
    var bondNames = [Agent(name: "Sean Connery", imageName: "sean_connery"),
                     Agent(name: "George Lazenby", imageName: "george_lazenby"),
                     Agent(name: "Roger Moore", imageName: "roger_moore"),
                     Agent(name: "Timothy Dalton", imageName: "timothy_dalton"),
                     Agent(name: "Pierce Brosnan", imageName: "pierce_brosnan"),
                     Agent(name: "Daniel Craig", imageName: "daniel_craig")]

    @IBOutlet weak var agentsTableView: UITableView! {
        didSet {
            agentsTableView.dataSource = self
            agentsTableView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // dependency injection
        if segue.identifier == "agentDetail" {
            let destinationVC = segue.destination as? DoubleOhSevenViewController
            destinationVC?.selectedBondName = bondNames[(agentsTableView.indexPathForSelectedRow?.row)!]
        }
    }
    

}

// DataSource functionality
extension AgentListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bondNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = agentsTableView.dequeueReusableCell(withIdentifier: "agentIdentifier", for: indexPath) as! AgentListTableViewCell
        cell.agentNameLabel.text = bondNames[indexPath.row].name
        cell.agentImageView.image = UIImage(named: bondNames[indexPath.row].imageName)
        return cell
    }
    
}

extension AgentListViewController: UITableViewDelegate {
    
    // funktioner til venstre for cellen
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let favorite = UIContextualAction(style: .normal, title: "Favorite"){ (action, view, nil) in
            print("Wow!. Du kunne klikke på mig!")
            
        }
        favorite.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        favorite.image = UIImage(systemName: "heart.fill")
        
        let accept = UIContextualAction(style: .normal, title: "Skyd ham!") { (action, view, nil) in
            print("Wow! Du kan også klikke på mig!")
        }
        accept.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        
        return UISwipeActionsConfiguration(actions: [favorite, accept])
    }
    
    
    // funktioner til højre for cellen
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "") { (action, view, nil) in
            print("nu sletter jeg agent: \(self.bondNames[indexPath.row].name)")
            self.bondNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        delete.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        delete.image = UIImage(systemName: "trash.circle.fill")
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
}


struct Agent {
    let name: String
    let imageName: String
}
