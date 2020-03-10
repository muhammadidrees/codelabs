part of 'custom_widgets.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar = AppBar();
  final Widget title;

  BaseAppBar({Key key, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: title,
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
      );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}