enum PostCardOrientation {
  vertical,
  horizontal;

  PostCardOrientation fromString(String text) {
    switch (text) {
      case 'vertical':
        return PostCardOrientation.vertical;
      case 'horizontal':
        return PostCardOrientation.horizontal;
      default:
        return PostCardOrientation.vertical;
    }
  }
}

class Postcard {
  final String imgPath;
  final String id;
  final PostCardOrientation orientation;

  Postcard({required this.imgPath,required this.id,required this.orientation});
}
