import 'package:flutter/material.dart';
import 'package:nasa_app/models/apod_model.dart';

class DetailScreen extends StatelessWidget {
  final ApodModel apodModel;
  int index;

  DetailScreen({required this.apodModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${apodModel.photos[index].camera.name} ${apodModel.photos[index].id}',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            height: 275,
            width: 420,
            child: Image.network(
              apodModel.photos[index].imgSrc,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 380,
            height: 100,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Camera Info',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                detailInfo('Id', '${apodModel.photos[index].camera.id}'),
                SizedBox(
                  height: 3,
                ),
                detailInfo(
                    'Full name', '${apodModel.photos[index].camera.fullName}'),
                SizedBox(
                  height: 3,
                ),
                detailInfo(
                    'Rover id', '${apodModel.photos[index].camera.roverId}')
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 15,
                  )
                ]),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 380,
            height: 125,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Rover Info',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                detailInfo('Name', '${apodModel.photos[index].rover.name}'),
                SizedBox(
                  height: 3,
                ),
                detailInfo('Launch date',
                    '${apodModel.photos[index].rover.launchDate}'),
                SizedBox(
                  height: 3,
                ),
                detailInfo('Landing date',
                    '${apodModel.photos[index].rover.landingDate}'),
                SizedBox(
                  height: 3,
                ),
                detailInfo('Status', '${apodModel.photos[index].rover.status}'),
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 15,
                  )
                ]),
          ),
        ],
      ),
    );
  }

  Widget detailInfo(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Row(
        children: [
          Text(
            '$title: ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$description',
          ),
        ],
      ),
    );
  }
}
