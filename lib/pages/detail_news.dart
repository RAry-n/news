import 'package:flutter/material.dart';

import '../data_class/top_headlines.dart';


class DetailsScreen extends StatefulWidget {
  DetailsScreen(this.data, {Key? key}) : super(key: key);
  Articles data;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.orange.shade900),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.data.title.toString(),
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              widget.data.author.toString(),
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Hero(
              tag: "${widget.data.title}",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network(
                    widget.data.urlToImage==null ? "https://previews.123rf.com/images/enterline/enterline1610/enterline161000243/63421889-the-word-news-written-in-watercolor-washes-over-a-white-paper-background-concept-and-theme.jpg"
                        : widget.data.urlToImage.toString()
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(widget.data.content.toString())
          ],
        ),
      ),
    );
  }
}