//
//  ViewController.swift
//  BackgroundDownloadIOS
//
//  Created by AMIT on 3/8/22.
//

import UIKit

class ViewController: UIViewController {

    let originalName = "file.mp4"
    
    let filepath = "https://dr.sf-converter.com/download?id=b870a0ae090c11c8cbdf54dd555f429c50cde5a264c6f8bcdce4baaa34cbd131&payload=1*eJzVVVuP2joQ%2FisVUv3UsLnayUpWFa4JLCywCwv7gkJiErO5EedCqPrf64Rte6o%2B9eg89EjRZ8eT8Xi%2B8Xz50mFJkblknYWd%2B06Q5ym7v7urqqpbJ0VeHEjXTaK7ysnd4HOJUZUfg9eqzly38%2Bnd0%2Fb%2B2NEpPJr8GjHLoCAILBbi%2BOyehbN2unb9JPFDUlKPJO1m7SwNnfrguG%2BfySWlGcESVKEu6RrSAaGYUTPZlf1i6jyufH29kNJajMwloCmWRKUriVJXMlBXQ4B6OBFMe3j0X6R8VdsLS54kZDtKJytIqnKQWXX8tnlIGSO1NSysAaC542NJFcEtb%2FyeJ8jIueAnYSzENWEgCvDmFUQRVqSPcl82QBTjX%2FLiq%2Fw90DTEYoZAxLBT8LXMK0BU4ogDxRCkIZZV4LsZPniAxjR3q9g7pAyrKpQ1EZRpVmIJRDQiuOXzozyKUhXEDFdWUZ6225HT25f06hcFenoSg90Y%2BDRrj%2BiGJMaKJkJRM4BXZFiWYFczNBBGeUsoQrqMdA0iRZbB9zUDikgFx5JzqYE3QlInpCVpNzzyYvDjiqKkIKXJmk%2BRrELg4pdhD%2BTcqmqKrCr8fHg0krfbXLPlajMyloClTuZwEm715M6EcqBpA14DnPaGspb0hqcfdPMXzg%2FHhgs%2BNFzwIWaNgTaGJlE%2B8BQ58uRA%2BD1aFDQOUQPNF1HjE7WblE34tNn8H6xzR%2Bpjc6z09xezWvl2YC6cwlQ0y1zv9oqfs9BdIfGY7WPX2tbj41OtWFdTR7FVbWyTDs3LtCcNdfv4fJmm8hkZ29eIBRdrKe89U5yr1Bafs9Tuv12L9UdlANpwj2dxOdGr1ZKHe0ynVJjbD8sXY7MvejNygafNwY90dKJ%2BXBnu%2Bo0uvK29fAhN2mNTqm%2FWAq2l%2FmO0GRvOYAfPa%2FM5nYrUng%2BdERG2oTAIoVHxaPzhXdm21%2F%2B0KxUInGbG%2BLS5gJKitqi1CFtEDUKxvZ5yi7erqrbYWPmd56gYaotai7BF1OLNavx9AtDW4E8FQNJ1aECo%2FFQAEf1UAF00JAMiVVeU%2F04BtH%2BlALfK%2Fm0a0DTlTNiTRyvz4qO1IJNgVI001TrMN0%2B7oF8fp8%2FqUDbXPoLKYmtS83QZ1d7eOlengTV7mTzo04j1UM3Pua6mon1U1Znfi0ZrZi5vTfm7CkyOYmI%2FxclYmajjg2k4wlwNkt5i%2FZrvRDpjmziwdztzIUwDHlAp5%2FAVnub2JipW6mDrzS4rTTfkFyQJo%2BvsupMHx749lq%2BH5Q8VyGkeEi4BduT4NCYfBpnjJzH7IHzokZCSkmT8o1ulmJl37n92%2BqcOZf2kiPOs7tHYo7Hfuc%2Bzgrz%2F75%2Fa4nXuv3SacvII%2FFfa%2BfouO78bFdj5%2BvUbj%2FO%2FkQ%3D%3D*1646796979*1998e5232521cdcf"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func downloadEvent(_ sender: Any) {
        DownloadManager.shared().startDownload(filepath, originalName)
    }
}

