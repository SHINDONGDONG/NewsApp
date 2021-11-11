import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var TableViewMain: UITableView!
    //news데이터를 json데이터로 저장하는 곳.
    var newsData : Array<Dictionary<String,Any>>?
    
    func getNews(){
        let apiKey : String = "https://newsapi.org/v2/top-headlines?country=kr&apiKey=e1b3a01d7ac24ccb866235acee95abf1"
        let task = URLSession.shared.dataTask(with: URL(string: apiKey)!) { (data,response,error) in
            if let jsonData = data {
                do{
                    let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! Dictionary<String,Any>
                    let articles = json["articles"] as! Array<Dictionary<String,Any>>
                    
                    self.newsData = articles
                    DispatchQueue.main.async{
                        self.TableViewMain.reloadData()
                    }
                    
                    
                }catch{
                    print("errorrrrrr")
                }
            }
            
        }
        task.resume()
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let news = newsData{
            return news.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
        let idx = indexPath.row
        if let news = newsData{
            let row = news[idx]
            if let r = row as? Dictionary<String,Any> {
                if let title = r["title"] as? String{
                    cell.LabelText.text = title
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let idx = indexPath.row
        if let news = newsData {
            let row = news[idx]
            if let r = row as? Dictionary<String,Any> {
                if let title = r["title"] as? String {
                    print(title)
                }
            }
        }
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewMain.dataSource = self
        TableViewMain.delegate = self
        getNews()
        
    }
    
}
