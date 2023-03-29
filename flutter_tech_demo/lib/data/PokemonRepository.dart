// Fetching pokemon in blulk has been modifed from:  https://medium.com/@omlondhe/creating-a-flutter-pokedex-23c167cae043

class PokemonRepository {
    int id;
    String name;
    String spriteImg;    
    PokemonRepository.fromJson(Map<String, dynamic> data)
        : id = data['id'],
          name = data['name'],
          spriteImg = data['img'];
             
    Map<String, dynamic> toJson() => {'id': id, 'name': name, 'img': spriteImg};
}