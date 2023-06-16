class SongList {
  int? id;
  String? title;
  String? artist;

  SongList({this.id, this.title, this.artist});

  SongList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    artist = json['artist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['artist'] = this.artist;
    return data;
  }
}