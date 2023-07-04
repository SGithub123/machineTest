//
//  MatchDetailsVC.swift
//  Assignment_match_tournament
//
//  Created by Sanket Bhamare on 03/07/23.
//

import UIKit

class MatchDetailsVC: UIViewController {
    
    var MatchDetailsVM : MatchDetailsViewModel?
    var matchData = [MatchDetailsModel]()
    
    @IBOutlet weak var match1Btn: UIButton!
    @IBOutlet weak var match2Btn: UIButton!
    
    @IBOutlet weak var tbl_view: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setData()
        APICall(url: BaseURL.url1)
    }
    
    func setData() {
        match1Btn.setTitle("Match 1", for: .normal)
        match2Btn.setTitle("Match 2", for: .normal)
        match1Btn.backgroundColor = UIColor.blue
        match1Btn.titleLabel?.textColor = UIColor.white
        match1Btn.setTitleColor(.white, for: .normal)
        match2Btn.titleLabel?.textColor = UIColor.black
        
        match1Btn.layer.cornerRadius = 10
        match2Btn.layer.cornerRadius = 10
    }
    
    @IBAction func match1BtnAction(_ sender: Any) {
        APICall(url: BaseURL.url1)
        match1Btn.backgroundColor = UIColor.blue
        match1Btn.titleLabel?.textColor = UIColor.white
        match1Btn.setTitleColor(.white, for: .normal)
        
        match2Btn.backgroundColor = UIColor.white
        match2Btn.titleLabel?.textColor = UIColor.black

    }
    
    @IBAction func match2btnAction(_ sender: Any) {
        APICall(url: BaseURL.url2)
        
        match1Btn.backgroundColor = UIColor.white
        match1Btn.titleLabel?.textColor = UIColor.black
        
        match2Btn.backgroundColor = UIColor.blue
        match2Btn.titleLabel?.textColor = UIColor.white
        match2Btn.setTitleColor(.white, for: .normal)
    }
    
}

extension MatchDetailsVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MatchDetailsVM?.MatchLVMResult.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbl_view.dequeueReusableCell(withIdentifier: "MatchCell", for: indexPath) as! MatchCell
        
        let data = self.MatchDetailsVM?.MatchAtIndex(indexPath.row)
    
        let teamHome = data?.matchDetails.teamHome ?? ""
        let teamAway = data?.matchDetails.teamAway ?? ""
        let series = data?.matchDetails.series?.tourName
        let dateStr = data?.matchDetails.match?.date ?? ""
        let venue = data?.matchDetails.venue?.name ?? ""
        
        
        cell.titleLbl.text = series ?? ""
        cell.team1Img.image = UIImage(named: teamHome)
        cell.team2Img.image = UIImage(named: teamAway)
        
        cell.team1Name.text = (data?.teams[teamHome]?.nameFull?.uppercased() ?? "")
        cell.team2Name.text = (data?.teams[teamAway]?.nameFull?.uppercased() ?? "")

        let date = dateFormatter(date: dateStr)
        
        cell.timeLBl.text = "\(date)\n at \(venue)"
        cell.seeDetailsBtn.addTarget(self, action: #selector(seeDetails), for: .touchUpInside)
        
        return cell
    }
    
    @objc func seeDetails() {
        let story = UIStoryboard.init(name: "MatchDetails", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "TeamDetailsVC") as! TeamDetailsVC
        vc.teamDetailsVM = MatchDetailsVM
        vc.teamData = matchData
        self.navigationController?.present(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
}
extension MatchDetailsVC {
    
    func APICall(url:String) {
        
        let url = URL(string:url)!
        Webservice().MatchDetailsAPICall(url: url) { (response) in
            guard let resData = response else { return }
            self.responseDataUsingURL(response: resData)
        }
    }
    
    func responseDataUsingURL(response:MatchDetailsModel) {
        
        
        if let result = response.matchdetail {
//            for i in 0 ..< result.count {
//                let data = result[i]
//                self.matchData.append(data)
//
//            }
            
            self.MatchDetailsVM = MatchDetailsViewModel(MatchLVMResult:[response])
            
            DispatchQueue.main.async {
                                
                self.tbl_view.reloadData()

            }
        }
        
    }
}


