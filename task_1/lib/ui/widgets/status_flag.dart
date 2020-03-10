part of 'custom_widgets.dart';

class StatusFlag extends StatelessWidget {

  final ComplaintStatus status;

  const StatusFlag({
    Key key, @required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _statusColor;
    String _statusText;

    switch (status) {
      case ComplaintStatus.pending:
        _statusColor = pending_status_color;
        _statusText = "PENDING";
        break;
        
      case ComplaintStatus.wroking:
        _statusColor = working_status_color;
        _statusText = "WORKING";
        break;
        
      case ComplaintStatus.resolved:
        _statusColor = resolved_status_color;
        _statusText = "RESOLVED";
        break;
        
      default:
        print("ERROR IN GETTING STATUS STATUS-FLAG");
        break;
    }

    return Container(
      padding: EdgeInsets.only(top: size_xs, bottom: size_xs, right: size_s, left: size_xl),
      decoration: BoxDecoration(
        color: _statusColor,
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Text(_statusText, style: Theme.of(context).textTheme.headline3),
    );
  }
}