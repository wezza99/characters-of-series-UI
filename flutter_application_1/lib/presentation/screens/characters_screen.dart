import 'package:flutter/material.dart';
import 'package:flutter_application_1/Data/Models/characters.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/cubit/character_cubit.dart';
import 'package:flutter_application_1/presentation/Widgets/items_character.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class characterscreen extends StatefulWidget {
  const characterscreen({super.key});

  @override
  State<characterscreen> createState() => _characterscreenState();
}

class _characterscreenState extends State<characterscreen> {
  late List<Character> allCharacters;
  late List<Character> searchedforcharacters;
  bool isSearching = false;
  final searchTextController = TextEditingController();
  final sccontroller = ScrollController();

  @override
  void initState() {
    super.initState();
    allCharacters =
        BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildsearchfield() {
    return TextField(
      cursorColor: MyColors.myGrey,
      controller: searchTextController,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: "Find a character",
        hintStyle: TextStyle(
          color: MyColors.myGrey,
          fontSize: 18,
        ),
      ),
      style: const TextStyle(
        color: MyColors.myGrey,
        fontSize: 18,
      ),
      onChanged: (searchedcharacter) {},
    );
  }

  void addSearchedforItemToSearchedList(String searchedCharacters) {
    searchedforcharacters = allCharacters.where((character) {
      return character.name.toLowerCase().contains(searchedCharacters);
    }).toList();
    setState(() {});
  }

  Widget _buildAppBarActions() {
    if (isSearching) {
      return IconButton(
        onPressed: () {
          clearsearch();
          Navigator.pop(context);
        },
        icon: const Icon(Icons.clear, color: MyColors.myGrey),
      );
    } else {
      return IconButton(
        onPressed: startsearch,
        icon: const Icon(
          Icons.search,
          color: MyColors.myGrey,
        ),
      );
    }
  }

  void startsearch() {
    ModalRoute.of(context)?.addLocalHistoryEntry(LocalHistoryEntry(
      onRemove: () {
        stopsearch();
      },
    ));
    setState(() {
      isSearching = true;
    });
  }

  void stopsearch() {
    clearsearch();
    setState(() {
      isSearching = false;
    });
  }

  clearsearch() {
    setState(() {
      searchTextController.clear();
    });
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharacterState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).characters;
          return buildLoadedListWidgets();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      controller: sccontroller,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: searchTextController.text.isEmpty
          ? allCharacters.length
          : searchedforcharacters.length,
      itemBuilder: (ctx, index) {
        return characteritem(
          mycharacter: searchTextController.text.isEmpty
              ? allCharacters[index]
              : searchedforcharacters[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: buildsearchfield(),
        /*
         isSearching 
            ? buildsearchfield()
            : const Text(
                "Characters",
                style: TextStyle(
                  color: MyColors.myGrey,
                  // hi ya zmely 
                  // rod 3lya 3shan a3raf enk m3aya 
                  //eshta
                  
                ),
              ),
              */
        actions: [
          _buildAppBarActions(),
        ],
        leading: BackButton(
          color: MyColors.myGrey,
        ),
        /*
         isSearching
            ? BackButton(
                color: MyColors.myGrey,
              )
            : Container(),
            */
      ),
      body: buildCharactersList(),
    );
  }
}
