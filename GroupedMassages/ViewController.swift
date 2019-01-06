//
//  ViewController.swift
//  GroupedMassages
//
//  Created by takeru on 2018/12/10.
//  Copyright © 2018 takeru. All rights reserved.
//

import UIKit

struct Message {
    let text: String
    let isIncoming: Bool
    let date: Date
}

extension Date {

    static func dateFrom(string: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/mm/dd"
        return formatter.date(from: string) ?? Date()
    }
}

class ViewController: UIViewController {

    private var tableView: UITableView!

//    private let messages = [
//        [
//            Message(text: "sfbjhndslangjsdangjdslanldsanfjksdalnfkljdsanfdjlknsalkfndskalnfjsaklnflkasndljkdsanfjklsnafjsnafjkldsnlfkdsalkfnsdajfklsadnflksnaflkjsdanfjlkndsalkfndsalknfdslafndslaknfdlsaknflksdanfjlksdanfjklasnjdkflnasnfjklsadnjlsknflskadnflsdkanfslnfsd", isIncoming: true, date: Date.dateFrom(string: "2018/12/10")),
//             Message(text: "nfksjdnfksf", isIncoming: true, date: Date.dateFrom(string: "2018/12/10")),
//             Message(text: "fsmdlfkmsdklfmslfmsdlfmslmfskfsd", isIncoming: false, date: Date.dateFrom(string: "2018/12/10"))
//        ],
//        [
//            Message(text: "sfbjhndslangjsdangjdslanldsanfjksdalnfkljdsanfdjlknsalkfndskalnfjsaklnflkasndljkdsanfjklsnafjsnafjkldsnlfkdsalkfnsdajfklsadnflksnaflkjsdanfjlkndsalkfndsalknfdslafndslaknfdlsaknflksdanfjlksdanfjklasnjdkflnasnfjklsadnjlsknflskadnflsdkanfslnfsd", isIncoming: true, date: Date.dateFrom(string: "2018/12/11")),
//             Message(text: "nfksjdnfksf", isIncoming: true, date: Date.dateFrom(string: "2018/12/11")),
//             Message(text: "fsmdlfkmsdklfmslfmsdlfmslmfskfsd", isIncoming: false, date: Date.dateFrom(string: "2018/12/11")),Message(text: "sfbjhndslangjsdangjdslanldsanfjksdalnfkljdsanfdjlknsalkfndskalnfjsaklnflkasndljkdsanfjklsnafjsnafjkldsnlfkdsalkfnsdajfklsadnflksnaflkjsdanfjlkndsalkfndsalknfdslafndslaknfdlsaknflksdanfjlksdanfjklasnjdkflnasnfjklsadnjlsknflskadnflsdkanfslnfsd", isIncoming: true, date: Date.dateFrom(string: "2018/12/11"))
//        ],
//        [
//            Message(text: "nfksjdnfksf", isIncoming: true, date: Date.dateFrom(string: "2018/12/15")),
//            Message(text: "fsmdlfkmsdklfmslfmsdlfmslmfskfsd", isIncoming: false, date: Date.dateFrom(string: "2018/12/15")),Message(text: "sfbjhndslangjsdangjdslanldsanfjksdalnfkljdsanfdjlknsalkfndskalnfjsaklnflkasndljkdsanfjklsnafjsnafjkldsnlfkdsalkfnsdajfklsadnflksnaflkjsdanfjlkndsalkfndsalknfdslafndslaknfdlsaknflksdanfjlksdanfjklasnjdkflnasnfjklsadnjlsknflskadnflsdkanfslnfsd", isIncoming: true, date: Date.dateFrom(string: "2018/12/15")),
//            Message(text: "nfksjdnfksf", isIncoming: true, date: Date.dateFrom(string: "2018/12/15")),
//            Message(text: "fsmdlfkmsdklfmslfmsdlfmslmfskfsd", isIncoming: false, date: Date.dateFrom(string: "2018/12/15")),Message(text: "sfbjhndslangjsdangjdslanldsanfjksdalnfkljdsanfdjlknsalkfndskalnfjsaklnflkasndljkdsanfjklsnafjsnafjkldsnlfkdsalkfnsdajfklsadnflksnaflkjsdanfjlkndsalkfndsalknfdslafndslaknfdlsaknflksdanfjlksdanfjklasnjdkflnasnfjklsadnjlsknflskadnflsdkanfslnfsd", isIncoming: true, date: Date.dateFrom(string: "2018/12/10")),
//            Message(text: "nfksjdnfksf", isIncoming: true, date: Date.dateFrom(string: "2018/12/15")),
//            Message(text: "fsmdlfkmsdklfmslfmsdlfmslmfskfsd", isIncoming: false, date: Date.dateFrom(string: "2018/12/15"))
//        ]
//    ]

    private var messagesFromServer = [
        Message(text: "sfbjhndslangjsdangjdslanldsanfjksdalnfkljdsanfdjlknsalkfndskalnfjsaklnflkasndljkdsanfjklsnafjsnafjkldsnlfkdsalkfnsdajfklsadnflksnaflkjsdanfjlkndsalkfndsalknfdslafndslaknfdlsaknflksdanfjlksdanfjklasnjdkflnasnfjklsadnjlsknflskadnflsdkanfslnfsd", isIncoming: true, date: Date.dateFrom(string: "2018/12/11")),
        Message(text: "nfksjdnfksf", isIncoming: true, date: Date.dateFrom(string: "2018/12/11")),
        Message(text: "fsmdlfkmsdklfmslfmsdlfmslmfskfsd", isIncoming: false, date: Date.dateFrom(string: "2018/12/11")),Message(text: "sfbjhndslangjsdangjdslanldsanfjksdalnfkljdsanfdjlknsalkfndskalnfjsaklnflkasndljkdsanfjklsnafjsnafjkldsnlfkdsalkfnsdajfklsadnflksnaflkjsdanfjlkndsalkfndsalknfdslafndslaknfdlsaknflksdanfjlksdanfjklasnjdkflnasnfjklsadnjlsknflskadnflsdkanfslnfsd", isIncoming: true, date: Date.dateFrom(string: "2018/12/11")),

        Message(text: "fsmdlfkmsdklfmslfmsdlfmslmfskfsd", isIncoming: false, date: Date.dateFrom(string: "2018/12/15")),Message(text: "sfbjhndslangjsdangjdslanldsanfjksdalnfkljdsanfdjlknsalkfndskalnfjsaklnflkasndljkdsanfjklsnafjsnafjkldsnlfkdsalkfnsdajfklsadnflksnaflkjsdanfjlkndsalkfndsalknfdslafndslaknfdlsaknflksdanfjlksdanfjklasnjdkflnasnfjklsadnjlsknflskadnflsdkanfslnfsd", isIncoming: true, date: Date.dateFrom(string: "2018/12/10")),
        Message(text: "nfksjdnfksf", isIncoming: true, date: Date.dateFrom(string: "2018/12/15")),
        Message(text: "fsmdlfkmsdklfmslfmsdlfmslmfskfsd", isIncoming: false, date: Date.dateFrom(string: "2018/12/15")),
        Message(text: "sfbjhndslangjsdangjdslanldsanfjksdalnfkljdsanfdjlknsalkfndskalnfjsaklnflkasndljkdsanfjklsnafjsnafjkldsnlfkdsalkfnsdajfklsadnflksnaflkjsdanfjlkndsalkfndsalknfdslafndslaknfdlsaknflksdanfjlksdanfjklasnjdkflnasnfjklsadnjlsknflskadnflsdkanfslnfsd", isIncoming: true, date: Date.dateFrom(string: "2018/12/10")),
        Message(text: "nfksjdnfksf", isIncoming: true, date: Date.dateFrom(string: "2018/12/10")),
        Message(text: "fsmdlfkmsdklfmslfmsdlfmslmfskfsd", isIncoming: false, date: Date.dateFrom(string: "2018/12/10")),
        Message(text: "nfksjdnfksf", isIncoming: true, date: Date.dateFrom(string: "2018/12/15")),
        Message(text: "fsmdlfkmsdklfmslfmsdlfmslmfskfsd", isIncoming: false, date: Date.dateFrom(string: "2018/12/15")),Message(text: "sfbjhndslangjsdangjdslanldsanfjksdalnfkljdsanfdjlknsalkfndskalnfjsaklnflkasndljkdsanfjklsnafjsnafjkldsnlfkdsalkfnsdajfklsadnflksnaflkjsdanfjlkndsalkfndsalknfdslafndslaknfdlsaknflksdanfjlksdanfjklasnjdkflnasnfjklsadnjlsknflskadnflsdkanfslnfsd", isIncoming: true, date: Date.dateFrom(string: "2018/12/15")),
        Message(text: "nfksjdnfksf", isIncoming: true, date: Date.dateFrom(string: "2018/12/15"))
    ]

    private var messages = [[Message]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        assembleGroupedMessages()
        setupView()
    }

    private func setupView() {
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true

        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.register(MessageCell.self, forCellReuseIdentifier: MessageCell.description())
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }

    private func assembleGroupedMessages() {
        let groupedMessages = Dictionary(grouping: messagesFromServer) { (element) -> Date in
            return element.date
        }
        let sortedKeys = groupedMessages.keys.sorted()
        sortedKeys.forEach { (key) in
            let values = groupedMessages[key]
            messages.append(values ?? [])
        }
    }
}

extension ViewController: UITableViewDelegate {

    class DateHeaderLabel: UILabel {

        override init(frame: CGRect) {
            super.init(frame: frame)
            textColor = .white
            backgroundColor = .black
            textAlignment = .center
            translatesAutoresizingMaskIntoConstraints = false
            font = UIFont.systemFont(ofSize: 12)
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override var intrinsicContentSize: CGSize {
            let originalContentSize = super.intrinsicContentSize
            let height = originalContentSize.height + 12
            layer.cornerRadius = height / 2
            layer.masksToBounds = true
            return CGSize(width: originalContentSize.width + 20, height: height)
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let firstMessageInSection = messages[section].first {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/mm/dd"
            let string = formatter.string(from: firstMessageInSection.date)
            let label = DateHeaderLabel()
            label.text = string

            let containerView = UIView()
            containerView.addSubview(label)
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
            return containerView
        }
        return nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return messages.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageCell.description(), for: indexPath) as! MessageCell
        cell.message = messages[indexPath.section][indexPath.row]
        return cell
    }
}
