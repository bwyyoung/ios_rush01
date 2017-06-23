//
//  ViewController.swift
//  piscine_rush01
//
//  Created by Brian Young on 6/23/17.
//  Copyright © 2017 byoung-w. All rights reserved.
//

import UIKit
import Mapbox
import CoreLocation
import MapboxDirections

class ViewController: UISearchController, CLLocationManagerDelegate, MGLMapViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate
    , UITableViewDelegate, UITableViewDataSource
{
    
    let searchController = UISearchController(searchResultsController: nil)
    var search_table: UITableView
    
    @IBOutlet var MapBoxView: MGLMapView!
    @IBOutlet weak var mapcontrol: UISegmentedControl!
    @IBOutlet weak var search_bar_view: UISearchBar!

    var manager:CLLocationManager!
    
    let user_loc = Location_User()

    
    var     placemarksarray:NSMutableArray = NSMutableArray();
    
    var     placemarkdictionary:Dictionary<String, PinAnnotation>! = Dictionary();
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        


               // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setup_search_bar()
    {
        self.searchResultsUpdater = self
        self.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        
        search_table = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.plain)
        search_table.delegate      =   self
        search_table.dataSource    =   self
        search_table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.search_table)
        search_table.tableHeaderView = searchController.searchBar
        search_bar_view.delegate = self
        
        search_table.contentInsets = UIEdgeInsets(x: 0.0, y: search_bar_view.bounds.size.height, 0.0, 0.0)
        search_table.contentOffset = CGPoint(x: 0.0, y: -search_bar_view.bounds.size.height)

    }
    
    func setup_location_manager()
    {
        manager = CLLocationManager()
        manager.delegate = self
        MapBoxView.delegate = self
        manager.requestAlwaysAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLocationClick(_ sender: Any)
    {
        
    }
    
    func movemap(coord:CLLocationCoordinate2D)
    {
        
    }
    
    @IBAction func segcontrol(sender: AnyObject)
    {
        switch (1) {
        case 0:
            break;
        case 1:
            break;
        case 2:
            break;
        default:
            break;
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus)
    {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self)
            {
                if CLLocationManager.isRangingAvailable()
                {
                    manager.desiredAccuracy = kCLLocationAccuracyBest
                    manager.requestWhenInUseAuthorization()
                    manager.startUpdatingLocation()
                }
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let userLocation:CLLocation = locations[0]
        user_loc.latitude_user = userLocation.coordinate.latitude
        user_loc.longitude_user = userLocation.coordinate.longitude
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

