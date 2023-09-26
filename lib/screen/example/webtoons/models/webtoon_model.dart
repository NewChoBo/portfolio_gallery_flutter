class WebtoonModel {
  final String title, thumb, id;

//생성자를 fromJson으로 만들어, 생성되도록
//아래는 dart의 named constructor
  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}

// class WebtoonModel {
//   //중괄호로 하려면 late 필요. 이게 빌더패턴이랑 더 비슷해보이긴 함 (lombok 어디?) 권장은 윗버전...
//   late final String title, thumb, id;

// //생성자를 fromJson으로 만들어, 생성되도록
// //아래는 dart의 named constructor
//   WebtoonModel.fromJson(Map<String, dynamic> json) {
//     title = json['title'];
//     thumb = json['thumb'];
//     id = json['id'];
//   }
// }
