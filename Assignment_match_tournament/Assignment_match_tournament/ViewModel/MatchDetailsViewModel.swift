//
//  MatchDetailsViewModel.swift
//  Assignment_match_tournament
//
//  Created by Sanket Bhamare on 03/07/23.
//


import Foundation

struct MatchDetailsViewModel {
    var MatchLVMResult : [MatchDetailsModel]
}

extension MatchDetailsViewModel {
    
    func numberOfRows(_ section:Int) -> Int {
        return MatchLVMResult.count
    }
    
    func MatchAtIndex(_ index:Int) -> MatchViewModel {
        let MatchResult = MatchLVMResult[index]
        return MatchViewModel(MatchResult)
    }
}

struct MatchViewModel {
    private var MatchVMResult : MatchDetailsModel
}

extension MatchViewModel {
    init(_ MatchResult: MatchDetailsModel) {
        self.MatchVMResult = MatchResult
    }
}

extension MatchViewModel {
    
    var matchDetails : Matchdetail {
        return MatchVMResult.matchdetail!
    }
    
    var teams : [String : Team] {
        return MatchVMResult.teams!
    }
    
    var innings : [Inning] {
        return MatchVMResult.innings!
    }
    
}

