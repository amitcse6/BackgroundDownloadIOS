//
//  Data+Extension.swift
//  BackgroundDownloadIOS
//
//  Created by AMIT on 3/9/22.
//

import Foundation

extension Data {
    func _isValidResumeData( data: Data?) -> Bool {
        if data == nil || (data?.count ?? 0) < 1 { return false }
        let error: Error? = nil
        var resumeDictionary: [AnyHashable : Any]? = nil
        do {
            resumeDictionary = try PropertyListSerialization.propertyList(from: data!, options: [], format: nil) as? [AnyHashable : Any]
        } catch { }
        if resumeDictionary == nil || error != nil { return false }
        guard let localFilePath = resumeDictionary?["NSURLSessionResumeInfoLocalPath"] as? String, localFilePath.count < 1 else { return false }
        return FileManager.default.fileExists(atPath: localFilePath)
    }
    
    func isValidResumeData( data: Data?) -> Bool {
        if data == nil || (data?.count ?? 0) < 1 { return false }
        let error: Error? = nil
        var resumeDictionary: [AnyHashable : Any]? = nil
        do {
            resumeDictionary = try PropertyListSerialization.propertyList(from: data!, options: [], format: nil) as? [AnyHashable : Any]
        } catch { }
        if resumeDictionary == nil || error != nil { return false }
        var sessionResumeInfoLocalPath: String? = nil
        if let objects = resumeDictionary?["$objects"] as? [Any] {
            for item in objects {
                if let value = item as? String, (value.contains("http://") || value.contains("https://")) {
                    sessionResumeInfoLocalPath = value
                }
            }
        }
        //guard let localTmpFilePath = resumeDictionary?["NSURLSessionResumeInfoLocalPath"] as? String, localTmpFilePath.count < 1 else { return false }
        guard let localTmpFilePath = sessionResumeInfoLocalPath, localTmpFilePath.count > 0 else { return false }
        let result: Bool = FileManager.default.fileExists(atPath: localTmpFilePath)
        if !result {
            let bundleIdentifier = Bundle.main.bundleIdentifier
            let localName = (localTmpFilePath as NSString).lastPathComponent
            let paths = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).map(\.path)
            let cachesDir = paths[0]
            let localCachePath = URL(fileURLWithPath: URL(fileURLWithPath: URL(fileURLWithPath: cachesDir).appendingPathComponent("com.apple.nsurlsessiond/Downloads").path).appendingPathComponent(bundleIdentifier!).path).appendingPathComponent(localName).path
            do {
                //result = try FileManager.default.moveItem(at: localCachePath, to: localTmpFilePath!)
                try FileManager.default.moveItem(atPath: localCachePath, toPath: localTmpFilePath)
                return true
            } catch {
            }
        }
        return result;
    }
}
