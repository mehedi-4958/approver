class DataList {
  bool success;
  String message;
  List details;

  DataList(
      {required this.success, required this.message, required this.details});

  DataList.fromJson(json)
      : success = json['success'],
        message = json['message'],
        details = json['data'];
}

class ItemDetail {
  int id;
  String title;
  String subtitle;
  String description;
  double amount;
  String thumb;
  String largeimage;
  String status;
  String declinedreason;
  String submittedat;
  String declinedat;
  String createdat;
  String updatedat;
  String approvedat;

  ItemDetail({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.amount,
    required this.thumb,
    required this.largeimage,
    required this.status,
    required this.declinedreason,
    required this.submittedat,
    required this.approvedat,
    required this.declinedat,
    required this.createdat,
    required this.updatedat,
  });

  ItemDetail.fromJson(json)
      : id = json['ID'],
        title = json['Title'],
        subtitle = json['Subtitle'] != null ? json['Subtitle'] : "",
        description = json['Description'] != null ? json['Description'] : "",
        amount = json['Amount'].toDouble(),
        thumb = json['Thumb'] != null ? json['Thumb'] : "",
        largeimage = json['LargeImage'] != null ? json['LargeImage'] : "",
        status = json['Status'],
        declinedreason =
            json['DeclinedReason'] != null ? json['DeclinedReason'] : "",
        submittedat = json['Submitted At'] != null ? json['Submitted At'] : "",
        approvedat = json['Approved At'] != null ? json['Approved At'] : "",
        declinedat = json['Declined At'] != null ? json['Declined At'] : "",
        createdat = json['created_at'],
        updatedat = json['updated_at'];
}
