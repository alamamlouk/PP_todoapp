enum Status { DONE, CANCELED, IN_PROGRESS, UNDONE, TODO, LATE }

extension StatusExtension on Status {
  String get formattedString {
    String statusString = this.toString().split('.')[1];
    statusString =
        statusString[0].toUpperCase() + statusString.substring(1).toLowerCase();
    statusString = statusString.replaceAll('_', ' ');
    return statusString;
  }
}
