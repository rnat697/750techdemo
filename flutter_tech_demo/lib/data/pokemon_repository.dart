// Fetching pokemon in blulk has been modifed from:  https://medium.com/@omlondhe/creating-a-flutter-pokedex-23c167cae043
// This is a data model to store the pokemon's basic information that has been fetched in bulk. This only requires data such as the 
//id of the pokemon, name of the pokemon and the image of the pokemon. This data will be shown on a grid.
class PokemonRepository {
    int id;
    String name;
    String spriteImg;    
    // Mapping the JSON data to the associated class fields
    PokemonRepository.fromJson(Map<String, dynamic> data)
        : id = data['id'],
          name = data['name'],
          spriteImg = data['img'];
             
    Map<String, dynamic> toJson() => {'id': id, 'name': name, 'img': spriteImg};
}