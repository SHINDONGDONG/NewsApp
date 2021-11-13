//
//  NewsDetailController.swift
//  NewsApp
//
//  Created by 申民鐡 on 2021/11/13.
//

import UIKit


class NewsDetailController : UIViewController {
//    @IBAction func WebView(_ sender: Any) {
//        if let controller = storyboard?.instantiateViewController(withIdentifier: "WebView"){
//        self.navigationController?.pushViewController(controller, animated: true)
//        }
//        
//    }
    @IBOutlet weak var ImageMain: UIImageView!
    @IBOutlet weak var LabelMain: UILabel!
    //1.image url
    //2. decription
    
    var imageUrl: String?
    var desc: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //값이 ok 이면
        if let image = imageUrl {
            //이미지를 뿌린다
            
            if let data = try? Data(contentsOf: URL(string: image)!) {
               //main Thread
                DispatchQueue.main.async {
                self.ImageMain.image = UIImage(data: data)
                }
            }
        }
    
        if let d = desc {
            //뉴스본문을 보여준다
            self.LabelMain.text = d
            }
        }
}
