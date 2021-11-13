//
//  Type1.swift
//  NewsApp
//
//  Created by 申民鐡 on 2021/11/09.
//

import UIKit

class Type1 : UITableViewCell {
    
    
    @IBOutlet weak var LabelText: UILabel!
    
}

//
//  ViewController.swift
//  NewsApp
//
//  Created by 申民鐡 on 2021/11/09.
//


//1. http 통신 - urlsession 으로
//2. api 데이터 형테는 json 이다 {"돈":"1000"} 키밸류값 {["10","200","3000"]}

//
//import UIKit
//
//class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
//
//    @IBOutlet weak var TableViewMain: UITableView!
//    //newsData에 title과 description을 넣을꺼라 배열에 딕셔날<스트링,애니>를 넣어줌.
//    var newsData : Array<Dictionary<String,Any>>?
//
//
//
//    //뉴스를 가지고오는 메소드
//    func getNews(){
//        //변수 task에 URL세션,쉐어드,데이터테스크 실제 api를 가지고온다. 이후 데이터,리스폰스,에러를 선언.
//        let task = URLSession.shared.dataTask(with: URL(string: "https://newsapi.org/v2/top-headlines?country=kr&apiKey=e1b3a01d7ac24ccb866235acee95abf1")!) { (data,response,error) in
//            //만약에 data 가 있으면 datajson에 담아줘라.
//            if let dataJson = data {
//
//                //try catch문과 비슷
//                do{
//                    //변수 json에 try하여 json초기화.json오브젝트를 가지고옴. 데이터가 저장될 datajson, option은 빈공간 타입은 dictionary<string,any> 로 확신한다.
//                    let json = try JSONSerialization.jsonObject(with: dataJson, options:[]) as! Dictionary<String,Any>
//                    //json 에 담아준 json파일들을 articles로 세부적으로 지정하여 담아준다. json["articles"]는 articles }[ {title:"aa"},{description:"aabb"}] 의 형태
//                    let articles = json["articles"] as! Array<Dictionary<String,Any>>
//
//                    //위에서 담아준 articles를 내자신 self.newsData에 등록을해주기위하여 DispatchQueue main async 비동기로 등록해준다.
//                    self.newsData = articles
//                    DispatchQueue.main.async {
//                        //self.Tableviewmain을 리로드시켜주어 다시 화면에 띄어준다.
//                        self.TableViewMain.reloadData()
//                    }
//
//                }
//                catch{
//                    print("error 발생함")
//                }
//            }
//        }
//        //작업을 다시 시작하려고하면 resume 메소드가 꼭 필요하다.
//        task.resume()
//    }
//
//
//
//
//    //위의 메소드에서 담아준 newsData의 갯수를 세어 리턴해준다.
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let news = newsData {
//            return news.count
//        }else{
//            return 0
//        }
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        //dequeueReusablecell은 테이블 셀을 만들고 그것을 지정한다.
//        let cell = TableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
//        let idx = indexPath.row
//        if let news = newsData {
//
//            let row = news[idx]
//            if let r = row as? Dictionary<String,Any> {
//                if let title = r["title"] as? String{
//                    cell.LabelText.text = title
//                }
//
//            }
//        }
//
//        return cell
//    }
//
//
//    //click
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let news = newsData{
//            let row = news[indexPath.row]
//            if let r = row as? Dictionary<String,Any>{
//                if let title = r["title"] as? String{
//                    print(title)
//                }
//            }
//        }
//
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        TableViewMain.delegate = self
//        TableViewMain.dataSource = self
//        getNews()
//    }
//
//
//}
//
