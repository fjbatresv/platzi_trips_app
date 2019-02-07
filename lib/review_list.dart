import 'package:flutter/material.dart';
import 'package:platzi_trips_app/review.dart';

class ReviewList extends StatelessWidget{

  int reviewsCount;

  ReviewList(this.reviewsCount);

  @override
  Widget build(BuildContext context) {

    List<Widget> generateReviews(){
      List<Widget> reviews = [];
      for(int i = 0; i < reviewsCount; i++){
        reviews.add(Review("assets/img/traveler.jpg", "Juan Lopez", "1 review | 5 photos", "Test comment"));
      }
      return reviews;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: generateReviews(),
    );
  }

}