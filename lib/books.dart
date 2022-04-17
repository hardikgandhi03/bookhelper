class Books {
  final String? bookName, bookAuthorName, star1, star2, star3, star4, star5;
  //final int? id;

  Books({
    //required this.id,
    required this.bookName,
    required this.bookAuthorName,
    required this.star1,
    required this.star2,
    required this.star3,
    required this.star4,
    required this.star5,
  });

  factory Books.fromJson(Map<String, dynamic> json) => Books(
        bookName: json['Name'],
        bookAuthorName: json['Authors'],
        star1: json['RatingDist1'],
        star2: json['RatingDist2'],
        star3: json['RatingDist3'],
        star4: json['RatingDist4'],
        star5: json['RatingDist5'],
      );
}
