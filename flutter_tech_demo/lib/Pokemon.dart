class Pokemon {
    int id;
    String name;
    String spriteImg;    
    Pokemon.fromJson(Map<String, dynamic> data)
        : id = data['id'],
          name = data['name'],
          spriteImg = data['img'];    Map<String, dynamic> toJson() => {'id': id, 'name': name, 'img': spriteImg};
}