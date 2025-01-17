import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplashblocversion/presantation/blocs/collection/collection_bloc.dart';
import 'package:unsplashblocversion/presantation/blocs/home/home_cubit.dart';
import 'package:unsplashblocversion/presantation/blocs/home/home_state.dart';
import 'package:unsplashblocversion/presantation/blocs/search/search_bloc.dart';
import 'package:unsplashblocversion/presantation/pages/search_page.dart';
import 'collection_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeCubit homeCubit;
  PageController pageController= PageController();

  @override
  void initState() {
    super.initState();
  homeCubit= context.read<HomeCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state){
        return Scaffold(
          backgroundColor: Colors.black,
          body: PageView(
            controller: pageController,
            children: [
              BlocProvider(
                create: (context)=> SearchBloc(),
                child: SearchPage(),
              ),
              BlocProvider(
                create: (context)=> CollectionBloc(),
                child: CollectionPage(),
              ),
            ],
            onPageChanged: (index) {
              homeCubit.onPageViewChange(index);
            },
          ),
          bottomNavigationBar: CupertinoTabBar(
            backgroundColor: Colors.black,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    size: 32,
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.collections,
                    size: 32,
                  )),
            ],
            onTap: (index) {
              homeCubit.onBottomChange(index);
              pageController.animateToPage(index,
                  duration: Duration(milliseconds: 200), curve: Curves.easeIn);
            },
            currentIndex: state.currentIndex,
            activeColor: Colors.white,
          ),
        );
      },
    );
  }
}
