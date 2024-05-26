import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tap2024/models/popular_model.dart';

class PopularView extends StatelessWidget {
   PopularView({super.key, this.popularModel});

    PopularModel ? popularModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 200, 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CachedNetworkImage ( 
            width: MediaQuery.of(context).size.width,
            imageUrl: 'https://image.tmdb.org/t/p/w500/${popularModel!.backdropPath}',
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => Image.network('https://uxwing.com/wp-content/themes/uxwing/download/web-app-development/image-not-found-icon.png'), 
                ),
                Container(
                  height: 60,
                  color: Colors.black54,
                  child: ListTile(
                    title: Text(popularModel!.title, style: TextStyle(color: Colors.white),),
                    //subtitle: Text(popularModel!.title, style: TextStyle(color: Colors.white),maxLines: 1,),
                    subtitle: Text(popularModel!.releaseDate, style: TextStyle(color: Colors.white),maxLines: 1,),
                    //trailing: Icon(Icons.favorite_border, color: Colors.white,),
                    trailing: IconButton(
                      onPressed:()=> Navigator.pushNamed(context, "/detail", arguments: popularModel),
                      icon: const Icon(Icons.chevron_right),
                      color: Colors.white,
                    )
                  ),
                )
          ],
        ),
      )
    );
  }
}