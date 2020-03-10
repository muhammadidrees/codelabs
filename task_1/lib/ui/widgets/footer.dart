part of 'custom_widgets.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          Text(
            "TV | Broadband | Phone",
            style: Theme.of(context).textTheme.bodyText1,
          ),

          SizedBox(
            height: size_s,
          ),

          Image.asset(
            "assets/images/bottom.png",
          ),
        ],
      ),
    );
  }
}