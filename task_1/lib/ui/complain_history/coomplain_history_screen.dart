import 'package:flutter/material.dart';
import 'package:task_1/constants.dart';
import 'package:task_1/ui/widgets/custom_widgets.dart';

class ComplainHistoryScreen extends StatelessWidget {
  
  final String title;

  const ComplainHistoryScreen({Key key, this.title}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        leading: FlatButton(
          onPressed: (){
            print("Menu was pressed");
          }, 
          child: Image.asset(
            "assets/images/back.png",
            height: app_icon_size,
          ),
        ),
        actions: <Widget>[
          // just to reduce the size of flat button
          SizedBox(
            width: 60.0,
            child: FlatButton(
              onPressed: (){
                print("Back was pressed");
              },
              child: Image.asset(
                "assets/images/icon_menu.png",
                height: app_icon_size,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Footer(),

          // screen padding
          Padding(
            padding: const EdgeInsets.all(size_l),

            child: Column(
              children: <Widget>[

                ListHeader(heading: "Complaint History"),

                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (_, i){
                      var statusList = ["pending", "working", "resolved"];

                      return ComplaintListItem(
                        listItemFront: ListItemFront(
                          index: "$i",
                          id: "${220300 + i}",
                          status: statusList[i%3],
                        ),
                      );
                    },
                  ),
                ),
                

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ComplaintListItem extends StatefulWidget {

  final ListItemFront listItemFront;

  const ComplaintListItem({
    Key key, @required this.listItemFront,
  }) : super(key: key);

  @override
  _ComplaintListItemState createState() => _ComplaintListItemState();
}

class _ComplaintListItemState extends State<ComplaintListItem> {

  bool _istapped = false; 

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[

        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: _istapped? 90.0 : 10.0,
          padding: EdgeInsets.only(top: size_xl + 8.0, bottom: size_s, right: size_l, left: size_l),
          margin: EdgeInsets.all(size_l),
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(size_l)
          ),
          child: ListItemBack(),
        ),

        GestureDetector(
          child: widget.listItemFront,
          onTap: (){
            setState(() {
              _istapped = !_istapped;
            });
          },
        ),
        
      ],
    );
  }
}

class ListItemBack extends StatelessWidget {
  const ListItemBack({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                Flexible(
                  child: Row(
                    children: <Widget>[
                      Expanded(flex: 1, child: Text("Service:", style: Theme.of(context).textTheme.bodyText1)),
                      Expanded(flex: 2, child: Text("Internet", style: Theme.of(context).textTheme.bodyText1)),
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    children: <Widget>[
                      Expanded(flex: 1, child: Text("Category:", style: Theme.of(context).textTheme.bodyText1)),
                      Expanded(flex: 2, child: Text("Activation Issue", style: Theme.of(context).textTheme.bodyText1)),
                    ],
                  ),
                ),
                Flexible(
                  child: Row(
                    children: <Widget>[
                      Expanded(flex: 1, child: Text("Fault:", style: Theme.of(context).textTheme.bodyText1)),
                      Expanded(flex: 2, child: Text("Improper Deployment", style: Theme.of(context).textTheme.bodyText1)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Flexible(child: Text("Complain Date:", style: Theme.of(context).textTheme.bodyText2)),
                          Flexible(child: Text("12/13/2018", style: Theme.of(context).textTheme.bodyText1)),
                        ],
                      ),
                    ],
                  ),
                ),

                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Flexible(child: Text("Last Updated On:", style: Theme.of(context).textTheme.bodyText2)),
                          Flexible(child: Text("12/13/2018", style: Theme.of(context).textTheme.bodyText1)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class ListItemFront extends StatelessWidget {

  final String index, id, status;

  const ListItemFront({
    Key key, @required this.index, @required this.id, @required this.status,
  }) : super(key: key);


  ComplaintStatus getStatus (String status){
    status = status.toUpperCase();

    switch (status) {
      case "PENDING":
        return ComplaintStatus.pending;
        break;
      case "WORKING":
        return ComplaintStatus.wroking;
        break;
      case "RESOLVED":
        return ComplaintStatus.resolved;
        break;
      default:
        print("ERROR IN GETTING STATUS LIST-ITEM-FRONT");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(size_s),
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // list index
              Text(index + ".", style: Theme.of(context).textTheme.headline2),

              // space b/w list and header
              SizedBox(width: size_xs),

              // list id header
              Text(id, style: Theme.of(context).textTheme.headline2),
            ],
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // list index
              StatusFlag(status: getStatus(status)),

              // space b/w list and header
              SizedBox(width: size_xs),

              // list icon
              Icon(Icons.keyboard_arrow_down),

            ],
          ),
        ],
      ),
    );
  }
}