class Personagem{
  final int char_id;
  final String name;
  final String img;
  final String nickname;

  const Personagem({
    required this.char_id,
    required this.name,
    required this.img,
    required this.nickname
  });

  factory Personagem.fromJson(Map<String, dynamic> json){
    return Personagem(
        char_id: json['char_id'],
        name: json['name'],
        img: json['img'],
        nickname: json['nickname']
    );
  }
}