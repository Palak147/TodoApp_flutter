class ToDo {
  int id;
  String title;
  bool isCompleted;

  ToDo(this.id, this.title, this.isCompleted);

  ToDo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isCompleted = json['completed'];
  }
}
