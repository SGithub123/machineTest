//
//  TeamDetailsVC.swift
//  Assignment_match_tournament
//
//  Created by Sanket Bhamare on 04/07/23.
//

import UIKit

class TeamDetailsVC: UIViewController {

    @IBOutlet weak var playerList_Tbl: UITableView!
    
    @IBOutlet weak var teamA_view: UIView!
    @IBOutlet weak var teamB_view: UIView!
    @IBOutlet weak var filterBtn: UIButton!
    
    var teamDetailsVM : MatchDetailsViewModel?
    var teamData = [MatchDetailsModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func filterButton(_ sender: UIButton) {
        alertController()
    }
    
    @IBAction func crossButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
    
    func alertController() {
        let alert = UIAlertController(title: "Select Team", message: "", preferredStyle: .alert)
        let teamA = UIAlertAction(title: "Team A", style: .default) { _ in
            print("Sdcss ")
            
        }
        let teamB = UIAlertAction(title: "Team B", style: .default) { _ in
            
        }
        let both = UIAlertAction(title: "Both", style: .default) { _ in
        }
        
        alert.addAction(teamA)
        alert.addAction(teamB)
        alert.addAction(both)
        
        present(alert, animated: true)
        
    }
}

@available(iOS 15.4, *)
extension TeamDetailsVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamDetailsVM?.MatchLVMResult.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playerList_Tbl.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath) as! TeamCell
        
        let data = self.teamDetailsVM?.MatchAtIndex(indexPath.row)
    
        let teamHome = data?.matchDetails.teamHome ?? ""
        let teamAway = data?.matchDetails.teamAway ?? ""
        let batsmen = data?.innings[indexPath.row].batsmen
        
        let teamAplayers = data?.teams[teamAway]?.players
        if let player = teamAplayers {
            
//            cell.teamA_name.text = player[indexPath.row]?.nameFull
        }
        
        let teamBplayers = data?.teams[teamHome]?.players
        if let player = teamBplayers {
//            cell.teamB_name.text = player[indexPath.row]?.nameFull
        }
        
        
        let series = data?.matchDetails.series?.tourName
        let dateStr = data?.matchDetails.match?.date ?? ""
        let venue = data?.matchDetails.venue?.name ?? ""
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
}
