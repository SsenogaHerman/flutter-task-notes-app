

class Taskitem {
  int id = 0;
  String title = " ";
  String priority = " ";
  String description = " ";
  bool isCompleted = false;


  Taskitem(int id, String title, String priority, String description,
      bool isCompleted) {
    this.id = id;
    this.title = title;
    this.priority = priority;
    this.description = description;
    this.isCompleted = isCompleted;
  }

  Map<String,dynamic> toJson(){
    return {
      "id": this.id,
      "title": this.title,
      "priority": this.priority,
      "description": this.description,
      "isCompleted": this.isCompleted
    };

  }

  Taskitem fromJson(Map<String,dynamic> json){
    Map<String,dynamic> map=toJson();
    int id=map['id'];
    String title=map['title'];
    String priority =map['priority'];
    String description=map['description'];
    bool isCompleted=map['isCompleted'];

    Taskitem task=Taskitem(id, title, priority, description, isCompleted);
    return task;
  }



}

