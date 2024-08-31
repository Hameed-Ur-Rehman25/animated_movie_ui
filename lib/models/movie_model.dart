class MovieModel {
  final String imagePath;
  final String name;
  final List<String> type;

  MovieModel({
    required this.imagePath,
    required this.name,
    required this.type,
  });

  static List<MovieModel> moviesList = [
    MovieModel(
      imagePath:
          'https://img.freepik.com/premium-photo/spiderman-figure-stands-front-building-with-spiderman-back_849416-1912.jpg?w=826',
      name: 'Spiderman',
      type: ['Action', 'Fun'],
    ),
    MovieModel(
      imagePath:
          'https://img.freepik.com/free-photo/cyberpunk-warrior-woman-portrait_23-2150712500.jpg?t=st=1725081440~exp=1725085040~hmac=c18cb2fab478b4b7a687eb1bcde53428bb336f2a7a11f5d34d7898fdab7e12d8&w=740',
      name: 'Warrior',
      type: ['Action', 'Dark'],
    ),
    MovieModel(
      imagePath:
          'https://img.freepik.com/free-photo/futuristic-ninja-digital-art_23-2151234822.jpg?t=st=1725081590~exp=1725085190~hmac=242d7c9c4392fbf23e7ac3e3a7e647d327a1dd91a95e007f136487f30e0bf7b2&w=740',
      name: 'Ninja',
      type: ['Action', 'Cartoon'],
    ),
    MovieModel(
      imagePath:
          'https://img.freepik.com/free-photo/cyberpunk-warrior-urban-scenery_23-2150712516.jpg?t=st=1725081594~exp=1725085194~hmac=547f2483824fa54960c73c233bb1d4cdf128ecc5eefe426cfed2d6b7640b9f3e&w=740',
      name: 'Warrior Urban',
      type: ['Futuristic', 'Game'],
    ),
  ];
}
