class WallPaper {
  final String id;
  final String title;
  final String wallPaperUrl;
  final List<String> tags;
  final String category;
  // bool isFavorite;
  const WallPaper({
    this.id,
    this.category,
    this.tags,
    this.title,
    this.wallPaperUrl,
    // this.isFavorite = false,
  });
}
