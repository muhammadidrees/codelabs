import 'package:flutter/material.dart';
import 'package:task_1/constants.dart';
import 'package:task_1/ui/widgets/custom_widgets.dart';

class ComplainHistoryScreen extends StatelessWidget {
  
  final String title;

  const ComplainHistoryScreen({Key key, this.title}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text("OPTIX"),
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
                          status: statusList[i % 3],  // just for randomizing the statuses
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