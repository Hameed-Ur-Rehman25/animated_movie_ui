import 'package:animated_page_builder/models/movie_model.dart';
import 'package:animated_page_builder/widgets/buy_ticket_button.dart';
import 'package:flutter/material.dart';

/// The `HomePage` class is a StatefulWidget that represents the main screen of the app.
/// It features a page view of movies with animations and a buy ticket button.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of movies to display in the PageView.
  final moviesList = MovieModel.moviesList;

  // Page controllers to manage the scrolling of the pages.
  PageController backgroundPageController = PageController();
  PageController upperPageController = PageController(viewportFraction: 0.75);

  // Current index of the page being displayed in the upper page view.
  int upperIndex = 0;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Initialize a listener to update `currentPage` whenever the upper page view changes.
    upperPageController.addListener(
      () => setState(() {
        currentPage = upperPageController.page!.round();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Obtain the screen size for responsive design.
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Background page view that displays movie images.
          ShaderMask(
            shaderCallback: (Rect bounds) {
              // Creates a gradient effect from white to transparent.
              return const LinearGradient(
                colors: [
                  Colors.white,
                  Colors.transparent,
                ],
                begin: Alignment.center,
                end: Alignment.bottomCenter,
              ).createShader(bounds);
            },
            child: PageView.builder(
              reverse: true, // Reverse the order of pages for a unique effect.
              controller: backgroundPageController,
              itemCount: moviesList.length,
              itemBuilder: (context, index) {
                // Display movie images in the background.
                return Image.network(
                  moviesList[index].imagePath,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          // Upper page view displaying detailed information about each movie.
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: size.height * 0.50,
                width: size.width,
                child: PageView.builder(
                  controller: upperPageController,
                  onPageChanged: (upperIndex) {
                    setState(() {
                      // Animate the background page view to match the current page in the upper view.
                      backgroundPageController.animateToPage(upperIndex,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);
                    });
                  },
                  itemCount: moviesList.length,
                  itemBuilder: (context, upperIndex) {
                    final movie = moviesList[upperIndex];
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      margin: const EdgeInsets.symmetric(horizontal: 20)
                          .copyWith(top: currentPage == upperIndex ? 0 : 50),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          // Container to display the movie image.
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            height: size.height * 0.33,
                            width: size.width * 0.53,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                alignment: Alignment.topCenter,
                                fit: BoxFit.cover,
                                image: NetworkImage(movie.imagePath),
                              ),
                            ),
                          ),
                          const Spacer(flex: 1),
                          // Display the movie's name.
                          Text(
                            movie.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 5),
                          // Display movie types (genres) in a row.
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              movie.type.length,
                              (value) => Container(
                                margin: const EdgeInsets.only(left: 15),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                child: Text(
                                  movie.type[value],
                                ),
                              ),
                            ),
                          ),
                          const Spacer(flex: 2),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 40),
              // Button to buy tickets.
              const BuyTicketButton(),
              const SizedBox(height: 40),
            ],
          )
        ],
      ),
    );
  }
}
