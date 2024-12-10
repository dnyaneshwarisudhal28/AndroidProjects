import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    Widget dataSection = Container(
      child: Text(
        DateFormat('MMMM d, H:m').format(DateTime.now()),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 24.0
        ),
      ),
    );

    Widget tempSection = Container(
      padding:const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
        const  Text(
              '20',
            style: TextStyle(
              fontSize: 80.0,
            ),
          ),
          Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 12.0),
                margin:const EdgeInsets.only(left: 6.0),
                child:const Text('\u2103',
                style: TextStyle(fontSize: 24.0
                ),),
              ),
          ),
          Image.asset(
           'assets/cloudy.png',
           width: 100.0,
           height: 100.0,
           fit: BoxFit.cover,
          )
        ],
      ),
    );

    Widget descSection = Container(
      child:const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
           Text(
            'India',
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white
            ),
          ),
          Text(
            'Cloudy',
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );

    return Container(
      padding: const EdgeInsets.all(60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          dataSection,
          tempSection,
          descSection
        ],
      ),
    );
  }
}
