import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';
import 'package:todo/favorite.dart';
import 'package:todo/provider/favorite_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final words = nouns.take(50).toList();
    final provider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('English Words'),
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
      floatingActionButton: FloatingActionButton.extended(onPressed:(){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const FavoritePage()
        ),
        );
      },
      label: Text("Favorites"),
      ),
    );
  }
}
