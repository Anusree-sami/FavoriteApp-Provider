import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/favorite_provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final words = provider.words;
    return Scaffold(
      appBar: AppBar(title: Text('Favorites'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount:words.length,
        itemBuilder: (context,index){
          final word = words[index];
          return
            // Text(index.toString()) ;
            ListTile(title: Text(word),
              trailing: IconButton(onPressed: (){
                provider.toggleFavorite(word);
              }, icon: provider.isExist(word)?
              const Icon(Icons.favorite,color: Colors.red,):
              Icon(Icons.favorite_border),
              ),
            );
        },
      ),
    );

  }
}
