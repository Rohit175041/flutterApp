import 'package:rohit_17/ui/MovieDetail.dart';
import 'package:rohit_17/ui/MotivationScreen.dart';
import 'package:flutter/material.dart';


class  MovieListView extends StatefulWidget {
  const MovieListView({Key key}) : super(key: key);

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {

  final List<Movie>movieList =Movie.getMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
        decoration:const BoxDecoration(
        gradient: LinearGradient(
        colors:<Color>[ Colors.black45,Colors.deepOrange],
        begin: Alignment.centerRight,
        end: Alignment.centerLeft
          )
         )
        ),
        actions: [
          IconButton(icon:const Icon(Icons.home),
              onPressed: (){Navigator.pop(context,
                MaterialPageRoute(builder: (context)=>const MotivationScreen()),);}
          ),
        ],
        title:const Center(
            child: Center(
                child: Text("Movies",),
            ),
        ),
      ),
      backgroundColor: Colors.blueGrey.shade400,
      body:Scrollbar(
        showTrackOnHover: true,
        isAlwaysShown: true,
        thickness: 12,
        child: Container(
          margin:const EdgeInsets.only(right: 10),
          child: ListView.builder(
              itemCount: movieList.length,
              itemBuilder:(BuildContext contex,int index){
                return Stack(
                    children:<Widget> [
                      Positioned(
                          child: movieCard(movieList[index], context)),
                      Positioned(
                        top: 3,
                          left: -5,
                          child: movieImage(movieList[index].images[0]))
                    ]);
          }
          ),
        ),
      ) ,
    );
  }

  Widget movieCard(Movie movie,BuildContext context){
    return InkWell(
      child: Container(
        margin:const EdgeInsets.only(left: 55),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
         color: Colors.blueGrey.shade800,
         child: Padding(
           padding: const EdgeInsets.only(left: 65,top: 0,bottom: 8,right: 8),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: <Widget>[
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Flexible(
                       child: Text(movie.title,
                         style:const TextStyle(
                             fontWeight: FontWeight.bold,fontSize:15,color: Colors.white),),
                     ),
                     Text(" Rating : ${movie.imdbRating} /10  ")
                   ],
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   Text("Released: ${movie.released} "),
                   Text(movie.rated)
                 ],
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   Text("Duration :${movie.runtime}")
                 ],
               ),

             ],

           ),
         ),
        ),

      ),
        onTap: (){
           Navigator.push(context,
               MaterialPageRoute(builder: (context)=> MovieListDetails(movieName: movie.title,movie: movie)));
         }
    );

  }

  Widget movieImage(String imageUrl){
    return Container(
      height: 114,
      width: 128,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover
        )
      ),
    );
  }
}

class MovieListDetails extends StatelessWidget {
  final String movieName;
 final Movie movie;


 const  MovieListDetails({Key key,this.movieName, this.movie}):super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
            decoration:const BoxDecoration(
                gradient: LinearGradient(
                    colors:<Color>[ Colors.black45,Colors.deepOrange],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft
                ))),
        //backgroundColor: Colors.blueGrey.shade900,
        toolbarHeight: 80,
        actions: [
          IconButton(icon:const Icon(Icons.home),
              onPressed: (){Navigator.push(context,
                MaterialPageRoute(builder: (context)=>const MotivationScreen()),);}
          ),
        ],
        title: const Center(child: Text("Movies")),

      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          MovieDetailsThumbnail(thumbnail: movie?.images[0]),
         MovieDetailHeaderWithPoster(movie: movie),
          const HorizontalLine(),
         MovieDetailsCast(movie: movie),
         const HorizontalLine(),
          MovieDetailsExtraPoster(posters: movie?.images)
        ],
      ),
    );
  }
}

class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;
  const MovieDetailsThumbnail({Key key,this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          children:<Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(thumbnail),
                    fit: BoxFit.cover
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Center(child: Icon(Icons.play_circle_outline,size: 120,color: Colors.white,)),
            )
          ],
        ),
        Container(
          decoration:const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0x00f5f5f5),Color(0xfff5f5f5)],
            begin: Alignment.topCenter,end: Alignment.bottomCenter
            ),
          ),
          height: 70,
        )
      ],
    );
  }
}

class MovieDetailHeaderWithPoster extends StatelessWidget {
  final Movie movie;
  const MovieDetailHeaderWithPoster({Key key,this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          MoviePoster(poster:movie.images[0].toString(),),
          const SizedBox(width: 16,),
          Expanded(
              child:MovieDetailHeader(movie: movie) )
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;
  const MoviePoster({Key key,this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius =const BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width/4,
          height: 180,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(poster),
              fit: BoxFit.cover
            )
          ),
        ),
      ),
    );
  }
}

class MovieDetailHeader extends StatelessWidget {
  final Movie movie;
  const MovieDetailHeader({Key key,this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("${movie?.year}.${movie?.genre}".toUpperCase(),
        style:const TextStyle(
          fontSize: 18,fontWeight: FontWeight.w400,
          color: Colors.blue
        ),
        ),
        Text(movie.title,style:const TextStyle(
          fontWeight: FontWeight.w500,fontSize: 32
        )),
        Text.rich(TextSpan(style:const TextStyle(
          fontSize: 14,fontWeight: FontWeight.w300
        ),children: <TextSpan>[
          TextSpan(
            text: movie?.plot
          ),
           const TextSpan(
                text: "More...",
                style: TextStyle(
                  fontSize: 12,fontWeight: FontWeight.w300,
                  color: Colors.lightBlue
                )
            )

        ]
        ))
      ],
    );
  }
}

class MovieDetailsCast extends StatelessWidget {
  final Movie movie;
  const MovieDetailsCast({Key key,this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          MovieField(field:"Cast",value:movie.actors),
          MovieField(field:"Director",value:movie?.director),
          MovieField(field: "Awards",value: movie?.awards),
          //MovieDetailHeader(movie: movie)
        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {
  final String field;
  final String value;
  const MovieField({Key key,this.field,this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("$field : ",style:const TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.w300,fontSize: 12
        ),),
        Expanded(child: Text(value,style:const TextStyle(
          color: Colors.black,fontSize: 12,fontWeight: FontWeight.w300
        ),))
      ],
    );
  }
}

class HorizontalLine extends StatelessWidget{
  const HorizontalLine({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12.0),
      child: Container(
        height: 1.5,
        color: Colors.grey,
      ),
    );
  }
}

class MovieDetailsExtraPoster extends StatelessWidget {
  final List<String> posters;
  const MovieDetailsExtraPoster({Key key,this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Text("More Movies Posters".toUpperCase(),
            style:const TextStyle(fontSize: 14,color: Colors.black),),
        ),
        Container(
          height: 180,
          padding:const EdgeInsets.symmetric(vertical: 6),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
              separatorBuilder: (context,index)=>const SizedBox(width: 8),
              itemCount: posters.length,
              itemBuilder: (context,index)=>ClipRRect(
                borderRadius:const BorderRadius.all(Radius.circular(10)),
                child: Container(
                  width: MediaQuery.of(context).size.width/4,
                  height: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(posters[index]),
                    fit: BoxFit.cover)
                  ),
                ),
              ),

          ),
        )
      ],
    );
  }
}
