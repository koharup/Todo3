//
//  ViewController.swift
//  Todo3
//
//  Created by kohari on 2019/09/26.
//  Copyright © 2019 kohari. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //UITableView、numberOfRowsInSectionの追加(表示するcell数を決める)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //戻り値の設定(表示するcell数)
        return TodoKobetsunonakami.count
    }
    
    //UITableView、cellForRowAtの追加(表示するcellの中身を決める)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //変数を作る
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        //変数の中身を作る
        TodoCell.textLabel!.text = TodoKobetsunonakami[indexPath.row]
        //戻り値の設定（表示する中身)
        return TodoCell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //追加画面で入力した内容を取得する
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            TodoKobetsunonakami = UserDefaults.standard.object(forKey: "TodoList") as! [String]
        }
    }
    
    // UITableViewDelegate
        func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
            let action = UITableViewRowAction(style: .destructive, title: "Detail"){ action, indexPath in
                TodoKobetsunonakami.remove(at: indexPath.row)
                tableView.reloadData()
                UserDefaults.standard.set( TodoKobetsunonakami, forKey: "TodoList" )
            }
            
            let action2 = UITableViewRowAction(style: .default, title: "cancel"){ action, indexPath in
                print(indexPath.row)
            }
            
            return [action,action2]
        }
        
    }

