import Alamofire
import UIKit

open class CLMooncellData {
    
    public init() {}
    
    public func homeData(completionHandler: @escaping (DataResponse<MCHomeSourceData, Error>) -> Void) {
        AF.requestMooncell(.home).responseData { responseData in
            let res = responseData.tryMap { data -> MCHomeSourceData in
                let extractor = try HomeME(data)
                let cn = MCHomeData(
                    events: extractor.extractEvents(target: .CN),
                    summons: extractor.extractSummons(target: .CN),
                    recentlyUpdatedData: extractor.extractNewData(target: .CN),
                    masterMissions: [extractor.extractMasterMission(target: .CN), extractor.extractMasterMission(target: .nextCN)])
                let jp = MCHomeData(
                    events: extractor.extractEvents(target: .JP),
                    summons: extractor.extractSummons(target: .JP),
                    recentlyUpdatedData: extractor.extractNewData(target: .JP),
                    masterMissions: [extractor.extractMasterMission(target: .JP)])
                let homeSourceData = MCHomeSourceData(cn: cn, jp: jp)
                return homeSourceData
            }
            completionHandler(res)
        }
    }
    
}

private let headers: HTTPHeaders = {
    #if os(iOS)
        let osVer = UIDevice.current.systemVersion.replacingOccurrences(of: ".", with: "_")
    #else
        let osVer = "13_2"
    #endif
    return HTTPHeaders(arrayLiteral:
        .defaultAcceptEncoding, .defaultAcceptLanguage, HTTPHeader(name: "User-Agent", value: "Mozilla/5.0 (iPhone; CPU iPhone OS \(osVer) like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148"))
}()

extension AF {
    static func requestMooncell(_ url: MooncellURL) -> DataRequest {
        return request(url, headers: headers)
    }
}
