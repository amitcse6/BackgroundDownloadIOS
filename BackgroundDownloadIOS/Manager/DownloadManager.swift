//
//  DownloadManager.swift
//  BackgroundDownloadIOS
//
//  Created by AMIT on 3/8/22.
//

import Foundation
import UIKit

class DownloadManager: NSObject, ObservableObject {
    private static var downloadManager: DownloadManager!
    
    private var urlSession: URLSession!
    private var tasks: [URLSessionTask] = []
    
    @discardableResult
    public static func shared() -> DownloadManager {
        if downloadManager == nil {
            downloadManager = DownloadManager()
        }
        return downloadManager
    }

    private override init() {
        super.init()
        //let config = URLSessionConfiguration.default
        let config = URLSessionConfiguration.background(withIdentifier: "com.amit.backgrounddownloadios")
        config.isDiscretionary = true
        config.sessionSendsLaunchEvents = true
        urlSession = URLSession(configuration: config, delegate: self, delegateQueue: nil) //OperationQueue.main
        updateTasks()
    }
    
    func startDownload(_ url: URL) {
        let task = urlSession.downloadTask(with: url)
        task.resume()
        tasks.append(task)
    }
    
    func startDownload(_ fileUrl: String?, _ fileName: String?) {
        if let fileUrl = fileUrl, let url = URL(string: fileUrl) {
            startDownload(url, fileName)
        }
    }
    
    func startDownload(_ url: URL, _ fileName: String?) {
        let task = urlSession.downloadTask(with: url)
        task.earliestBeginDate = Date().addingTimeInterval(1)
        task.countOfBytesClientExpectsToSend = 200
        task.countOfBytesClientExpectsToReceive = 500 * 1024
        task.resume()
        tasks.append(task)
    }

    private func updateTasks() {
        urlSession.getAllTasks { tasks in
            DispatchQueue.main.async {
                self.tasks = tasks
            }
        }
    }
}

extension DownloadManager: URLSessionDelegate, URLSessionDownloadDelegate {
    func urlSession(_: URLSession, downloadTask: URLSessionDownloadTask, didWriteData _didWriteData: Int64, totalBytesWritten _totalBytesWritten: Int64, totalBytesExpectedToWrite _totalBytesExpectedToWrite: Int64) {
        print("Progress \(downloadTask.progress.fractionCompleted) for \(downloadTask)  \(_totalBytesWritten) \(_totalBytesExpectedToWrite)")
    }
    
    func urlSession(_: URLSession, downloadTask task: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("Download finished: \(location.absoluteString)")
        guard
            let httpURLResponse = task.response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
            let mimeType = task.response?.mimeType else {
                print ("Response error!");
                return
            }
        DownloadManager.save((task.currentRequest?.url!)!, location, mimeType, nil)
    }
    
    func urlSession(_: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let error = error {
            print("Download error: \(String(describing: error))")
            let _error = error as NSError
            if let resumeData = _error.userInfo[NSURLSessionDownloadTaskResumeData] as? Data {
                let task = DownloadManager.shared().urlSession.downloadTask(withResumeData: resumeData)
                task.resume()
            }
        } else {
            print("Task finished: \(task)")
        }
    }

    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        DispatchQueue.main.async {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate, let backgroundCompletionHandler = appDelegate.backgroundCompletionHandler else { return }
            backgroundCompletionHandler()
        }
    }
}

extension DownloadManager {
    private static func save(_ url: URL, _ location: URL, _ mimeType: String, _ fileName: String?) {
        do {
            if mimeType.hasPrefix("image") {
                guard let inputImage = UIImage(named: location.path) else { return }
                UIImageWriteToSavedPhotosAlbum(inputImage, nil, nil, nil)
            }else {
                let documentsURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                let savedURL = documentsURL.appendingPathComponent((fileName == nil) ? url.lastPathComponent : fileName!)
                if FileManager.default.fileExists(atPath: savedURL.path) { try! FileManager.default.removeItem(at: savedURL) }
                try FileManager.default.moveItem(at: location, to: savedURL)
                DispatchQueue.main.async {
                    print("\((fileName == nil) ? url.lastPathComponent : fileName!) download successfully")
                }
            }
        } catch {print ("file error: \(error)")}
    }
}
