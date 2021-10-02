import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw6/feature/domain/entities/person_enity.dart';
import 'package:hw6/feature/presentation/BLoc/personListCubit/person_lisat_cubit.dart';
import 'package:hw6/feature/presentation/BLoc/seacrhBloc/search_bloc.dart';
import 'package:hw6/feature/presentation/BLoc/seacrhBloc/search_event.dart';
import 'package:hw6/feature/presentation/BLoc/seacrhBloc/search_state.dart';
import 'package:hw6/feature/presentation/widgets/search_result.dart';


class CustomSearchDelegate extends SearchDelegate {
  final  scrollController = ScrollController();
  final int page = 1;
  CustomSearchDelegate() : super(searchFieldLabel: 'Search for characters...');
  void setupScrollController(BuildContext context) {

    scrollController.addListener(() {
      if(scrollController.position.atEdge) {
        if(scrollController.position.pixels != 0 ){
          context.read<PersonSearchBloc>();
        }
      }
    });
  }

  final _suggestions = [
    'Rick',
    'Morty',
    'Summer',
    'Beth',
    'Jerry',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back_outlined),
        tooltip: 'Back',
        onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    print('Inside custom search delegate and search query is $query');
    setupScrollController(context);




    BlocProvider.of<PersonSearchBloc>(context, listen: false)
        .add(SearchPersons(personQuery: query));

    return BlocBuilder<PersonSearchBloc, PersonSearchState>(


      builder: (context, state) {
        List<PersonEntity> persons = [];
        bool isLoading = false;
        if (state is PersonSearchLoading && state.isFirstFetch) {
          return _loadingIndicator();
        } else if (state is PersonSearchLoading) {
          persons = state.oldPersonsList;
          isLoading = true;
        } else if(state is PersonSearchLoaded) {
          persons = state.persons;
        } else if(state is PersonSearchError) {
          return Text(
            state.message,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          );
        }
          return ListView.separated(
            controller: scrollController,
            itemBuilder: (context, index) {
              if(index < persons.length) {
                return SearchResult(personResult: persons[index]);
              }else {
                Timer(const Duration(milliseconds: 30), () {
                  scrollController.jumpTo(scrollController.position.maxScrollExtent);
                });
                return _loadingIndicator();
              }

            },
            itemCount: persons.length + (isLoading ? 1 : 0),
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey[400],
                );
              },
          );
        }

          );
  }

  Widget _showErrorText(String errorMessage) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Text(
          errorMessage,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      return Container();
    }

    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return Text(
          _suggestions[index],
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: _suggestions.length,
    );
  }
  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}