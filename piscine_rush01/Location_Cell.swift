//
//  Location_Cell.swift
//  piscine_d05
//
//  Created by Brian Young on 16/6/17.
//  Copyright © 2017 Brian Young. All rights reserved.
//

import UIKit

class Location_Cell: UITableViewCell
{

	@IBOutlet weak var Cell_Label: UILabel!

	var location_data_local : Location_Data?
    override func awakeFromNib()
	{
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
	{
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	func updateUI(note: Location_Data)
	{
		self.Cell_Label.text = note.get_name();
		location_data_local = note
	}
}
