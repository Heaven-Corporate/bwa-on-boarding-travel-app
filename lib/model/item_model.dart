class ItemModel {
  String? imageUrl;
  String? title;
  String? subtitle;

  ItemModel({this.imageUrl, this.title, this.subtitle});

  ItemModel.fromJson(json) {
    imageUrl = json['imageUrl'];
    title = json['tittle'];
    subtitle = json['subtitle'];
  }
}
