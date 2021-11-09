//
//  ViewController.swift
//  NewsApp
//
//  Created by 申民鐡 on 2021/11/09.
//


//1. http 통신
//2. api 데이터 형테는 json 이다 {"돈":"1000"} 키밸류값 {["10","200","3000"]}


import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var TableViewMain: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        99
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //dequeueReusablecell은 테이블 셀을 만들고 그것을 지정한다.
        let cell = TableViewMain.dequeueReusableCell(withIdentifier: "Type1", for: indexPath) as! Type1
        cell.LabelText.text = "이것은 \(indexPath.row) 번째 입니다."
        return cell
    }
    
    
    //click
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)번째 클릭입니다.")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
        
        
    }


}

