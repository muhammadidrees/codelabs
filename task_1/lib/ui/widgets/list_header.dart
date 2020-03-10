part of 'custom_widgets.dart';

class ListHeader extends StatelessWidget {
  final String heading;

  const ListHeader({
    Key key,
    this.heading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: size_l),
      child: Row(
        children: <Widget>[
          Text(
            heading,
            style: Theme.of(context).textTheme.headline1,
          ),

          Expanded(
            child: Container(
              height: 8.0,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.black),
                ),
              ),
            ), 
          ),
        ],
      ),
    );
  }
}