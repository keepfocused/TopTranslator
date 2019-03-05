//
//  WordsListViewController.swift
//  TopTranslator
//
//  Created by Danil on 20.08.2018.
//  Copyright © 2018 Danil. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class WordsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    
    var words = [WordAsset]() {
        didSet {
            if (words.count > 0) {
                print("Words count = \(words.count)")
               tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        self.tabBarController?.title = "LearnListController"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let realm = try? Realm() else { return }
        guard let wordsData = realm.objects(ScanData.self).first else {
            return
        }
        words = Array(wordsData.words.filter("inLearn == false"))
        
    }
    
    func setupTableView() {
        let displayWidth:CGFloat = self.view.frame.width
        let displayHeight:CGFloat = self.view.frame.height
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: displayWidth, height: displayHeight))
        tableView.register(UINib.init(nibName: "WordCell", bundle: nil), forCellReuseIdentifier: "wordCell")
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: WordCell = tableView.dequeueReusableCell(withIdentifier: "wordCell") as! WordCell
        cell.word = words[indexPath.row]
        cell.textLabel?.text = words[indexPath.row].word + "   " + String(words[indexPath.row].foundedInTextCount)
        cell.addButton.addTarget(self, action: #selector(addWord(sender: )), for: .touchUpInside)
        cell.addButton.tag = indexPath.row

        return cell
    }
    
    @objc func addWord(sender: UIButton) {
        print("button pressed")
        print("type of sender = \(type(of: sender))")
        print("selected row = \(sender.tag)")
        
        let indexPath = IndexPath.init(row: sender.tag, section: 0)
        
        let cell = tableView(tableView, cellForRowAt: indexPath ) as? WordCell
        let word = cell?.word
        //Add to learn list
        //Mark & update data
        
        
        print("selected word: \(cell?.textLabel?.text)")
        
        tableView.beginUpdates()
        guard let realm = try? Realm() else { return }
        try? realm.write {
            word?.inLearn = true
        }
        
        words.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .right)
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
