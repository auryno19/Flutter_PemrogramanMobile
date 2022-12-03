import 'dart:async';
import 'package:flutter/material.dart';
import 'package:daftar_item/models/item.dart';
import 'package:daftar_item/utils/database_helper.dart';
import 'package:intl/intl.dart';

class ItemDetail extends StatefulWidget {

	final String appBarTitle;
	final Item item;

	ItemDetail(this. item, this.appBarTitle);

	@override
  State<StatefulWidget> createState() {

    return ItemDetailState(this.item, this.appBarTitle);
  }
}

class ItemDetailState extends State<ItemDetail> {

	DatabaseHelper helper = DatabaseHelper();

	String appBarTitle;
	Item item;

	TextEditingController titleController = TextEditingController();
	TextEditingController priceController = TextEditingController();

	ItemDetailState(this.item, this.appBarTitle);

	@override
  Widget build(BuildContext context) {

		TextStyle textStyle = Theme.of(context).textTheme.headline6;

		titleController.text = item.name;
		priceController.text = item.price;

    return WillPopScope(

	    onWillPop: () {
	    	// Write some code to control things, when user press Back navigation button in device navigationBar
		    moveToLastScreen();
	    },

	    child: Scaffold(
	    appBar: AppBar(
		    title: Text(appBarTitle),
		    leading: IconButton(icon: Icon(
				    Icons.arrow_back),
				    onPressed: () {
		    	    // Write some code to control things, when user press back button in AppBar
		    	    moveToLastScreen();
				    }
		    ),
	    ),

	    body: Padding(
		    padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
		    child: ListView(
			    children: <Widget>[

				    // Second Element
				    Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: titleController,
						    style: textStyle,
						    onChanged: (value) {
						    	debugPrint('Something changed in Title Text Field');
						    	updateTitle();
						    },
						    decoration: InputDecoration(
							    labelText: 'Title',
							    labelStyle: textStyle,
							    border: OutlineInputBorder(
								    borderRadius: BorderRadius.circular(5.0)
							    )
						    ),
					    ),
				    ),

				    // Third Element
				    Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: priceController,
						    style: textStyle,
						    onChanged: (value) {
							    debugPrint('Something changed in Description Text Field');
							    updatePrice();
						    },
						    decoration: InputDecoration(
								    labelText: 'Price',
								    labelStyle: textStyle,
								    border: OutlineInputBorder(
										    borderRadius: BorderRadius.circular(5.0)
								    )
						    ),
					    ),
				    ),

				    // Fourth Element
				    Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: Row(
						    children: <Widget>[
						    	Expanded(
								     child: ElevatedButton(
                      child: Text(
                        'save',
                        textScaleFactor: 1.5,
                        ),
                      onPressed: () {
                        setState(() {
                          debugPrint("Save Button clicked");
                          _save();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColorDark,
                        foregroundColor: Theme.of(context).primaryColorLight,
                      ), 
                    ),
							    ),

							    Container(width: 5.0,),

							    Expanded(
								   child: ElevatedButton(
                      child: Text(
                        'delete',
                        textScaleFactor: 1.5,
                        ),
                      onPressed: () {
                        setState(() {
                          debugPrint("Delete Button clicked");
                          _delete();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColorDark,
                        foregroundColor: Theme.of(context).primaryColorLight,
                      ), 
                    ),
							    ),

						    ],
					    ),
				    ),

			    ],
		    ),
	    ),

    ));
  }

  void moveToLastScreen() {
		Navigator.pop(context, true);
  }


	// Update the title of Item object
  void updateTitle(){
    item.name = titleController.text;
  }

	// Update the description of item object
	void updatePrice() {
		item.price = priceController.text;
	}

	// Save data to database
	void _save() async {

		moveToLastScreen();

		int result;
		if (item.id != null) {  // Case 1: Update operation
			result = await helper.updateItem(item);
		} else { // Case 2: Insert Operation
			result = await helper.insertItem(item);
		}

		if (result != 0) {  // Success
			_showAlertDialog('Status', 'Item Saved Successfully');
		} else {  // Failure
			_showAlertDialog('Status', 'Problem Saving Item');
		}

	}

	void _delete() async {

		moveToLastScreen();

		// Case 1: If user is trying to delete the NEW Item i.e. he has come to
		// the detail page by pressing the FAB of Item page.
		if (item.id == null) {
			_showAlertDialog('Status', 'No Item was deleted');
			return;
		}

		// Case 2: User is trying to delete the old Item that already has a valid ID.
		int result = await helper.deleteItem(item.id);
		if (result != 0) {
			_showAlertDialog('Status', 'Item Deleted Successfully');
		} else {
			_showAlertDialog('Status', 'Error Occured while Deleting Item');
		}
	}

	void _showAlertDialog(String title, String message) {

		AlertDialog alertDialog = AlertDialog(
			title: Text(title),
			content: Text(message),
		);
		showDialog(
				context: context,
				builder: (_) => alertDialog
		);
	}

}
