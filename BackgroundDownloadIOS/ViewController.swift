//
//  ViewController.swift
//  BackgroundDownloadIOS
//
//  Created by AMIT on 3/8/22.
//

import UIKit

class ViewController: UIViewController {

    let originalName = "file.mp4"
    
    let filepath = "https://dr.sf-converter.com/download?id=b8e07d3e15e188f50dc7c2df0839705f9c31a9bcf1bced726cc32d9792cceb21&payload=1*eJzVVltvozgU%2FitVpPHTkIK5V7JGhISENG1zaZKSl4qAQ9xgIFwDo%2F73NaQ7ndXuy6z2YVaKPhsfzjk%2B37E%2F8r2XxUXq4XUa9u56xzxPsrvb26qq%2BnVc5MUe972Y3lZu7h2%2FlUit8sNxV9Wp5%2FW%2Bfnja%2Fi87uoVP4r9mTFOR47gs4g5vLve2h7gfxHEQ4pL4OO5CdbMkdOu9652%2B4UtCUowERVJUiZcFAWCCSk6jTsItR76yknJpDrEZ1UYFSIIEXuwLgtCHUO1DngfERzFn2PuQrEbhotZN6XR5berm%2BX73PDRWejZS5JfEOj%2B4m%2FnR8hdzQHI3QILEg2vZ6KNMkOJzwbaSZSGqcQboEW12gFIkCl%2BgCXVAI%2FRTWWyNPUVJjNUIp4BmyC3YWuoXgJaIMiBIBIlHocdsbcAkRFACgZeivQ9IRHKvivx9kiFJUKDMgzJJSyQASihGHbFfoEUTCUQZOpDH8cOk9vSioePA0oicct4kGIOApF1sL8QREmVe4WUd%2BEWKoKD0ZV0GIc0Zt1ATBE3RNV0QIGO4W2N8C5qsQHAoGa0yOGGcuCEpcRfwwPrCtsvzgqiKbf1sqkJJAR7ajgYgZ1ZZFqEksv2haQkNcQzXqyJJ1AXIEjd1WdHX1jJnTBiQpAW%2FBdaAlr6O%2FpazH8SzB8YPw5YLNrRcsCHKWgNpDW2hbGAlMmTFgfDPbPTYOtAW2jdo60O7IGWb%2FqMT7axN8xP%2FLAQJkDEWzdeLUS0XdnB%2FDrzT%2BiVvoOi%2BydrDOs%2FP%2BqusvCXT1%2BNbPKZz2oytwT199Ex7MbSHy8XSbraGdWoiwzGdhWNt%2BFkxprV3aiwoP8RrVcwmnlN9EYfsB7qET2d%2BMdW6hI5OXOK8HKLZrng9qdtNbq8mZ31uNDEf2r7jh94KE20mixlLaMaWqoVu5a8vp4dJqTZ%2BiXU8ueClawd5MpLINrh3w%2BeZKwXXhOyqdrfu%2F3lVRQW47Sxj0%2FYsCqLUodyh0qHaosJ3JxV2eD21UoetFaoaQ1GXOpQ7VDpUO7xa9d9ZFbp2%2FKoqCJqmsoapn7LAq5%2BywBaYjWcN1f87WZD%2FlSxce%2Fz7CkNgH42ne1PdcMQT6o3gNrPBy%2BOFptv96Sj5IduSOdxb8QluH81RbZCRUR2FajBd8k24POPd4TEbJMlilKrOSuZiZ3l43kwP1qraOf76n2TBr4m8nj1VtjSQ4DYvLzx3rhKsGXCU8ovAr5Qj2eWmtnH5VocGNLw845FupZzC67pYzOXVdKuO5Crzq4nli9OtWzvnl3Vu%2FJCFnOQhZppgUzcgEb4Zpm4QR9kNdzPAIcElTtlL145lRt67%2B7z8X3skM%2BMiytN6QCKfREHvLk8L%2FPGvYNU1sXf3vde2lWVgX9ze%2B4cO%2Fd0oKr339z8AUqfNlg%3D%3D*1646718912*aaf5c7a9433702df"
    
    //let filepath = "https://cdn.pixabay.com/download/audio/2022/02/10/audio_fc48af67b2.mp3?filename=relax-and-sleep-18565.mp3"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func downloadEvent(_ sender: Any) {
        DownloadManager.shared().startDownload(filepath, originalName)
    }
}

