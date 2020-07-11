import 'dart:convert';
class User
{
  String name;
  int age;

  User(this.name, this.age);

  Map toJson()=>
  {
    'name':name,
  'age':age,
  };
}

class Tutorial
{
  String title;
  String description;
  User author;
  List<Tag> tags;

  Tutorial(this.title, this.description, [this.author, this.tags]);

  Map toJson(){
    Map author=
        this.author!=null?this.author.toJson():null;

    List<Map> tags =
              this.tags!=null?this.tags.map((i)=>i.toJson()).toList():null;
    return {
      'title':title, 'description':description, 'author':author, 'tags':tags};
    }
  }

  class Tag
  {
    String name;
    int quantity;

    Tag(this.name, this.quantity);

    Map toJson()=>{
      'name':name,
      'quantity':quantity,
    };
  }



void main()
{
  User user =User("bezkoder", 21);
  Tutorial tutorial =Tutorial('Dart Tut#1', "Tut£1 Description",user);

  //FirstExample
  String jsonUser=jsonEncode(user);
  print(jsonUser);

//Second Example
  String jsonTutorial=jsonEncode(tutorial);
  print(jsonTutorial);

  //Third Example

  List<Tag> tags =[Tag('tagA', 3), Tag('tagB',6)];
  String jsonTags=jsonEncode(tags);
  print(jsonTags);

  //Fourth Example

  Tutorial tutorial1 =Tutorial('Dart Tut#1', "Tut£1 Description",user, tags);
  String jsonTutorial1 =jsonEncode(tutorial1);
  print(jsonTutorial1);
}