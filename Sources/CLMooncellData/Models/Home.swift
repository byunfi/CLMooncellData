//
//  Home.swift
//  
//
//  Created by byunfi on 2019/12/13.
//

import Foundation

public struct MCHomeBox {
    public let sectionName: String
    public let cards: [MCCard]
}

public struct MCCard {
    public let title: String
    public let imageSrc: String
    public let href: String?
}

public struct MCMasterMission {
    public let sectionName: String
    public let date: String
    public let missions: [String]
}

public struct MCHomeData {
    public let sourceType: MCHomeSourceType
    public let events: [MCHomeBox]
    public let summons: [MCHomeBox]
    public let recentlyUpdatedData: [MCHomeBox]
    public let masterMissions: [MCMasterMission]
}

public struct MCEventListItem {
    public let openDate: String
    public let closeDate: String
    public let name: String
    public let href: String?
    public let imageSrc: String
    public let type: String
    public let officialHref: String?
}

public enum MCHomeSourceType: String {
    case CN, JP
}
