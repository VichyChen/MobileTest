//
//  ViewController.swift
//  MoblieTest
//
//  Created by Dajie Chen on 2025/2/15.
//

import UIKit

/*
 1. 实现一个data manager充当booking的数据提供者，源数据参考附件中的booking. json
 1.1. 包含service层
 1.2. 包含本地持久化缓存层
 1.3. 假定service层获取的数据有时效性，针对时效性做代码处理
 1.4. 支持刷新机制和提供对外统一接口获取数据
 1.4.1 对缓存数据，新数据做合理处理井无缝展示到UI层面上
 1.5. 错误处理
 2.创建列表展示数据，要求该page每出现(不一定是首次创建）的时候，调用dataprovider接口，在console中打印出对应data。
 3.注意事项
 3.1 Service层可以使用提供的Json文件mock response
 3.2 使用git commit代码上传至github，仓库名统一改名为"mobileTest"
 */

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: CustomTableView!
    
    let dataManager = MTDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        refreshData()
    }
    
    @objc func refreshData() {
        dataManager.fetchData { [weak self] result in
            switch result {
            case .success(let booking):
                self?.tableView.booking = booking
            case .failure:
                print("error")
                self?.tableView.endRefreshing()
            }
        }
    }
}

