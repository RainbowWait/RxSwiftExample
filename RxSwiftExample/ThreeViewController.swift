//
//  ThreeViewController.swift
//  RxSwiftExample
//
//  Created by 郑小燕 on 2018/6/5.
//  Copyright © 2018年 郑小燕. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ThreeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let musciListViewModel = MusicListViewModel()
    let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
//        items(cellIdentifier: "musicCell")){_, music, cell in
//            cell.textLabel?.text = music.name
//            cell.detailTextLabel?.text = music.singer
//        }
        super.viewDidLoad()
//        musciListViewModel.data
//            .bind(to: tableView.rx.items(cellIdentifier:"musicCell")) { _, music, cell in
//                cell.textLabel?.text = music.name
//                cell.detailTextLabel?.text = music.singer
//            }.disposed(by: disposeBag)

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "musicCell")
        musciListViewModel.data.bind(to: tableView.rx.items(cellIdentifier: "musicCell", cellType: UITableViewCell.self)){ index, music, cell in
                            cell.textLabel?.text = music.name
                            cell.detailTextLabel?.text = music.singer
                        }.disposed(by: disposeBag)

        tableView.rx.modelSelected(Music.self).subscribe(onNext: { (music) in
            print("你选中的歌曲信息：[\(music)]")
        }).disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
