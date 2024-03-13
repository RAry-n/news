import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news/data_class/top_headlines.dart';
import 'package:news/pages/category_news.dart';
import 'package:news/view_models/headlines_view_model.dart';

import '../components/headlines_card.dart';
import '../components/recent_news.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HeadlinesViewModel headlinesvm =HeadlinesViewModel();
  @override
  Widget build(BuildContext context) {
    final width= MediaQuery.sizeOf(context).width * 1;
    final height= MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Top News', style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesNews()));
          },
          icon: Icon(Icons.grid_view_rounded),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            //height: height,
            width: width,
            child: FutureBuilder<TopHeadlines>(
              future: headlinesvm.fetchheadlines(context),
              builder: (BuildContext context,snapshot)
              {
                if(snapshot.connectionState == ConnectionState.waiting)
                  {
                    return Center(
                      child: SpinKitFadingCircle(
                        size: 50,
                        color : Colors.blue
                      ) ,
                    );
                  }
                else
                  {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Headlines",
                              style: TextStyle(
                                fontSize: 26.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            //let's build our caroussel
                            CarouselSlider.builder(
                                itemCount: snapshot.data!.articles!.length,
                                itemBuilder: (context, index, id) =>
                                    BreakingNewsCard(snapshot.data!.articles![index+7]),
                                options: CarouselOptions(
                                  aspectRatio: 16 / 9,
                                  enableInfiniteScroll: false,
                                  enlargeCenterPage: true,
                                )),
                            SizedBox(
                              height: 40.0,
                            ),
                            Text(
                              "Recent News",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            //now let's create the cards for the recent news
                            Column(
                              children: snapshot.data!.articles!
                                  .map((e) => NewsListTile(e))
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              },
            ),
          )
        ],
      ),
    );
  }
}
