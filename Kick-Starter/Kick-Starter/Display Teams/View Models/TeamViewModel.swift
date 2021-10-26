//
//  TeamViewModel.swift
//  Kick-Starter
//
//  Created by Abdullah Nana on 2021/10/04.
//

import Foundation

final class TeamViewModel {
    private(set) var teamResponse: SoccerTeamResponseModel?
    private(set) var selectedVenue: Venue?
    private(set) var selectedLeague: League?
    private var teamRepository: TeamRepositable
    private weak var delegate: TeamViewModelDelegate?
    
    init(repository: TeamRepositable, delegate: TeamViewModelDelegate) {
        self.teamRepository =  repository
        self.delegate = delegate
    }
    
    func endpoint(league: String = "39", season: String = "2020") -> String {
        "https://v3.football.api-sports.io/teams?league=\(league)&season=\(season)"
    }
    
    func searchEndpoint(searchString: String) -> String {
        "https://v3.football.api-sports.io/teams?search=\(searchString)"
    }
    
    func fetchTeamData(endpoint: String) {
        teamRepository.fetchTeamData(method: .GET, endpoint: endpoint) { [weak self] result in
            switch result {
            case .success(let team):
                self?.teamResponse = team
                self?.delegate?.refreshViewContents()
                if team.response.isEmpty {
                    self?.delegate?.showSearchError()
                }
            case .failure(let error):
                self?.delegate?.showErrorMessage(error: error)
            }
        }
    }
    
    func set(league: League) {
        selectedLeague = league
    }
    
    func teamData(at index: Int) -> Response? {
        teamResponse?.response[safe: index]
    }
    
    func setSelectedVenue(index: Int) {
        selectedVenue = teamResponse?.response[safe: index]?.venue
    }
    
    var numberOfTeamResults: Int {
        teamResponse?.response.count ?? 0
    }
}
