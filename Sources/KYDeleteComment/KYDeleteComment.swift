import Foundation

@main
public struct KYDeleteComment {

    public static func main() {
        let manager = FileManager.default
        let dirPath = "file:///Users/keyon/Desktop/KYDeleteComment/TGRecommend"
        let resourceKeys : [URLResourceKey] = [.creationDateKey, .isDirectoryKey]
        guard let url = URL(string: dirPath) else { return }
        guard let enumerator = manager.enumerator(at: url, includingPropertiesForKeys: resourceKeys, options: [.skipsHiddenFiles]) else { return }
//        for case let fileURL as URL in enumerator {
//            if fileURL.path.hasSuffix(".swift") && !fileURL.path.contains("/Pods") {
//                try? Parser.parse(url: fileURL)
//            }
//        }
        if let url = URL(string: "file:///Users/keyon/Desktop/KYDeleteComment/TGRecommend/TelegramRecommend/NetWork/HomeNetwork.swift") {
            try? Parser.parse(url: url)
        }
        
        
    }
}
