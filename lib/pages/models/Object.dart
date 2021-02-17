class ObjectModel {
  String nome;
  String preco;
  String img;
  String categoria;

  ObjectModel({this.nome, this.preco, this.img, this.categoria});

  static ObjectModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    return ObjectModel(
        nome: map['nome'],
        preco: map['preco'],
        img: map['img'],
        categoria: map['categoria']);
  }
}
