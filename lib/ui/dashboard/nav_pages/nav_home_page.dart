import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommercer_app/ui/dashboard/bloc/category/cat_bloc.dart';
import 'package:ecommercer_app/ui/dashboard/bloc/category/cat_state.dart';
import 'package:ecommercer_app/ui/product/bloc/product_event.dart';
import 'package:ecommercer_app/ui/product/bloc/product_state.dart';
import 'package:ecommercer_app/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/category/cat_event.dart';

class NavHomePage extends StatefulWidget {
  NavHomePage({super.key});

  @override
  State<NavHomePage> createState() => _NavHomePageState();
}

class _NavHomePageState extends State<NavHomePage> {
  int selectedBannerIndex = 0;

  @override
  void initState() {
    super.initState();

    // context.read<ProductBloc>().add(FetchProductEvent());
    context.read<CategoryBloc>().add(FetchCategoryEvent());
  }

  List<String> mBannerImages = [
    "https://t3.ftcdn.net/jpg/03/28/04/54/360_F_32804a5426_uJy7UOJC0BFFEioxqRe1fLUH3G5WjFeU.jpg",
    "https://static.vecteezy.com/system/resources/previews/006/651/510/non_2x/spring-sale-banner-design-spring-sale-header-or-banner-design-with-up-to-50-with-colorful-background-with-flowers-can-be-used-for-banners-wallpaper-flyers-business-cards-web-discount-vector.jpg",
    "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/spring-sale-promo-landscape-banner-template-b-design-a0700ebccba1ea7a549d4b6eb11a0260_screen.jpg?ts=1713063621",
    "data:image/jpeg;base64,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",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_outlined, size: 25),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_outlined, size: 25),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Color(0xfff6f6f6),
                  prefixIcon: Icon(Icons.search, size: 25),
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 24,
                        child: VerticalDivider(
                          color: Colors.grey,
                          width: 10,
                          thickness: 1,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.filter_list),
                      SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 25),
            StatefulBuilder(
              builder: (context, sS) {
                return SizedBox(
                  height: 190,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      CarouselSlider.builder(
                        itemCount: mBannerImages.length,
                        itemBuilder: (_, index, _) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 11.0,
                            ),
                            child: Container(
                              height: 220,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.deepOrange,
                                image: DecorationImage(
                                  image: NetworkImage(mBannerImages[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },

                        options: CarouselOptions(
                          height: 220,
                          onPageChanged: (index, _) {
                            selectedBannerIndex = index;
                            sS(() {});
                          },
                          autoPlayCurve: Curves.slowMiddle,
                          viewportFraction: 1,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          //  color: Colors.black,
                          height: 40,
                          child: DotsIndicator(
                            position: selectedBannerIndex.toDouble(),
                            dotsCount: mBannerImages.length,
                            animate: true,
                            decorator: DotsDecorator(
                              activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11),
                              ),
                              activeColor: Colors.black,
                              activeSize: Size(16, 7),
                              spacing: EdgeInsets.symmetric(horizontal: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(11),
                                side: BorderSide(),
                              ),
                              color: Colors.transparent,
                              size: Size(7, 7),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 40),
            SizedBox(
              height: 100,
              child: BlocBuilder<CategoryBloc, CategoryState>(
                builder: (_, state) {
                  if (state is CategoryLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state is CategoryErrorState) {
                    return Text(state.errorMsg);
                  }
                  if (state is CategorySuccessState) {
                    return state.mCategories!.isNotEmpty
                        ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                            itemCount: state.mCategories!.length,
                            itemBuilder: (_, index) {
                              return Column(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      state.mCategories![index].name ?? "",
                                    ),
                                  ),
                                  Text(state.mCategories![index].name ?? ""),
                                ],
                              );
                            },
                          )
                        : Center(child: Text("No categories found"));
                  }
                  return Container();
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Special For You",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Expanded(
            //   child: BlocBuilder<ProductBloc, ProductState>(
            //     builder: (context, state) {
            //       if (state is ProductLoadingState) {
            //         return Center(child: CircularProgressIndicator());
            //       }
            //       if (state is ProductLoadedState) {
            //         return GridView.builder(
            //           padding: EdgeInsets.symmetric(horizontal: 5),
            //           itemCount: state.products.length,
            //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //             crossAxisCount: 2,
            //             mainAxisSpacing: 10,
            //             crossAxisSpacing: 10,
            //             childAspectRatio: 0.75,
            //           ),
            //           itemBuilder: (_, index) {
            //             final product = state.products[index];
            //
            //             return ProductCard(product: product);
            //           },
            //         );
            //       }
            //       if (state is ProductErrorState) {
            //         return Center(child: Text(state.errorMsg));
            //       }
            //
            //       return SizedBox();
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
