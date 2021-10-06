import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_app/models/apod_model.dart';
import 'package:nasa_app/screens/cubit/main_screen_cubit.dart';
import 'package:nasa_app/screens/detail_screen.dart';

import 'cubit/mian_screen_state.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    ApodModel apodModel;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Eticon Mars Photo',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: BlocBuilder<MainScreenCubit, MainScreenState>(
          builder: (context, state) {
            if (state is MainScreenLoading) {
              BlocProvider.of<MainScreenCubit>(context).getData();
              return Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state is MainScreenError) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(state.errorMsg),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        BlocProvider.of<MainScreenCubit>(context)
                            .emit(MainScreenLoading());
                      },
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Center(
                          child: Text('Retry'),
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if (state is MainScreenLoaded) {
              return ListView.builder(itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          apodModel = state.result;
                          return DetailScreen(apodModel: apodModel, index: index,);

                        }
                    )
                    );
                  },
                  child: Column(
                    children: [
                      SizedBox(height: 15,),
                      Container(
                        height: 75,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CircleAvatar(
                              backgroundImage: Image.network(state.result.photos[index].imgSrc).image,
                              maxRadius: 50,
                            ),
                            Text(state.result.photos[index].camera.name),
                            SizedBox(width: 5,),
                            Text(state.result.photos[index].id.toString()),
                          ],
                        ),
                      ),
                      Divider(color: Colors.grey,)
                    ],
                  ),
                );
              });
            }
            return Container();
          },
        ));
  }
}
