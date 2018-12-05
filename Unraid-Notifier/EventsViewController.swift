//
//  ViewController.swift
//  Unraid-Notifier
//
//  Created by Thomas on 30/11/2018.
//  Copyright © 2018 Thomas. All rights reserved.
//

import UIKit
import UserNotifications

class EventsViewController: UITableViewController {

    var movieService = APIMoviesService()
    var events: [MovieEvent] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        registerForNotifications()
        loadData()

        tableView.register(MovieEventCell.self, forCellReuseIdentifier: "eventCell")
        tableView.rowHeight = 64.0
        tableView.separatorStyle = .singleLine
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell") as? MovieEventCell {
            let event = events[indexPath.row]
            cell.titleLabel.text = event.movie?.title
            switch event.eventType {
            case "Download":
                cell.eventLabel.text = "Download Finished"
            case "Grab":
                cell.eventLabel.text = "Added to client"
            default:
                cell.eventLabel.text = "Unknown Event"
            }
//            cell.setupImage(forEvent: event.enumEventType)
            return cell
        }
        return UITableViewCell()
    }

    @objc func loadData() {
        movieService.getEvents()
            .done { (events) -> Void in
                self.events = events
                self.tableView.reloadData()
                self.tableView.refreshControl?.endRefreshing()
            }
            .catch { (error) in
                print("Promise Rejected : \(error)")
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.setSelected(true, animated: true)
    }

    //MARK: - Notification registration

    func registerForNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            print("Permission granted: \(granted)")
            self.getNotificationSettings()
        }
    }

    func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            print("Notification settings: \(settings)")
            guard settings.authorizationStatus == .authorized else { return }
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }

}

