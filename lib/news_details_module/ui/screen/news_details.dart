import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../Helpers/colors.dart';
import '../webview/webview.dart';

class NewsDetails extends StatefulWidget {
  final String? title;
  final String? image;
  final String? date;
  final String? author;
  final String? url;

  NewsDetails({this.title, this.image, this.date, this.author, this.url});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor,
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(
                      value: progress.progress,
                    ),
                  ),
                  width: double.infinity,
                  imageUrl: widget.image.toString(),
                ),
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: PrimaryColor,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: Colors.red,
                          size: 15,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        Text(
                          "${DateFormat.yMMMMEEEEd().format(DateTime.parse(widget.date.toString()))}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  top: 16,
                  child: IconButton(
                    onPressed: () async {
                      await Share.share("By News App: \n ${widget.url}",subject: "News App");
                    },
                    icon: Icon(Icons.share),
                    iconSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${widget.author ?? "no author"}",

                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
              child: Text(
                "${widget.title ?? "no title"}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20,left: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children:[ Text("For More Info Visit The Link Bellow",style: TextStyle(color: Colors.grey,
                  fontSize: 12,
                  ),),
                    // Image.asset("assets/images/emoji.jpeg",width: 18,height: 18,color: Colors.grey,)



                ]),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebVieww(
                        url: widget.url,
                      ),
                    ),
                  );
                },
                child: Text(
                  "${widget.url}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "${timeago.format(DateTime.parse(widget.date.toString()))}",
textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 12,

                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
