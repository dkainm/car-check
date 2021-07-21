//
//  ViewController.swift
//  CarCheckProject
//
//  Created by Алексей Волков on 07.07.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var questions = [Question(name: "Вопрос1", description: "Описание1", photo: nil, topic: "Тема1"),
                     Question(name: "Вопрос2", description: "Описание2", photo: nil, topic: "Тема1"),
                     Question(name: "Вопрос3", description: "Описание3", photo: nil, topic: "Тема2"),
                     Question(name: "Вопрос4", description: "Описание4", photo: nil, topic: "Тема3"),
                     Question(name: "Вопрос5", description: "Описание5", photo: nil, topic: "Тема4")]
    
    var topics: [[Question]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var newArray: [String] = []
        for question in questions {
            //если не содержит такую тему
            if !newArray.contains(question.topic) {
                newArray.append(question.topic)
            }
            
        }
        //сортируем вопросы по темам
        for topicName in newArray {
            let topic = questions.filter { (question) in
                return question.topic == topicName
            }
            topics.append(topic)
        }
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return topics.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topics[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let question = topics[indexPath.section][indexPath.row]
        cell.textLabel?.text = question.name
        cell.detailTextLabel?.text = question.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        if cell.accessoryType == .checkmark {
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .checkmark
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return topics[section].first!.topic
    }
    
}
