// class Temp {
//   String id;
//   String name;
//   String ratingDist1;
//   int pagesNumber;
//   String ratingDist4;
//   String ratingDistTotal;
//   int publishMonth;
//   int publishDay;
//   String publisher;
//   int countsOfReview;
//   int publishYear;
//   String language;
//   String authors;
//   double rating;
//   String ratingDist2;
//   String ratingDist5;
//   dynamic isbn;
//   String ratingDist3;

//   Temp(
//       {required this.id,
//       required this.name,
//       required this.ratingDist1,
//       required this.pagesNumber,
//       required this.ratingDist4,
//       required this.ratingDistTotal,
//       required this.publishMonth,
//       required this.publishDay,
//       required this.publisher,
//       required this.countsOfReview,
//       required this.publishYear,
//       required this.language,
//       required this.authors,
//       required this.rating,
//       required this.ratingDist2,
//       required this.ratingDist5,
//       this.isbn,
//       required this.ratingDist3});

//   Temp.fromJson(Map<String, dynamic> json) {
//     if (json["Id"] is String) this.id = json["Id"];
//     if (json["Name"] is String) this.name = json["Name"];
//     if (json["RatingDist1"] is String) this.ratingDist1 = json["RatingDist1"];
//     if (json["pagesNumber"] is int) this.pagesNumber = json["pagesNumber"];
//     if (json["RatingDist4"] is String) this.ratingDist4 = json["RatingDist4"];
//     if (json["RatingDistTotal"] is String)
//       this.ratingDistTotal = json["RatingDistTotal"];
//     if (json["PublishMonth"] is int) this.publishMonth = json["PublishMonth"];
//     if (json["PublishDay"] is int) this.publishDay = json["PublishDay"];
//     if (json["Publisher"] is String) this.publisher = json["Publisher"];
//     if (json["CountsOfReview"] is int)
//       this.countsOfReview = json["CountsOfReview"];
//     if (json["PublishYear"] is int) this.publishYear = json["PublishYear"];
//     if (json["Language"] is String) this.language = json["Language"];
//     if (json["Authors"] is String) this.authors = json["Authors"];
//     if (json["Rating"] is double) this.rating = json["Rating"];
//     if (json["RatingDist2"] is String) this.ratingDist2 = json["RatingDist2"];
//     if (json["RatingDist5"] is String) this.ratingDist5 = json["RatingDist5"];
//     this.isbn = json["ISBN"];
//     if (json["RatingDist3"] is String) this.ratingDist3 = json["RatingDist3"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data["Id"] = this.id;
//     data["Name"] = this.name;
//     data["RatingDist1"] = this.ratingDist1;
//     data["pagesNumber"] = this.pagesNumber;
//     data["RatingDist4"] = this.ratingDist4;
//     data["RatingDistTotal"] = this.ratingDistTotal;
//     data["PublishMonth"] = this.publishMonth;
//     data["PublishDay"] = this.publishDay;
//     data["Publisher"] = this.publisher;
//     data["CountsOfReview"] = this.countsOfReview;
//     data["PublishYear"] = this.publishYear;
//     data["Language"] = this.language;
//     data["Authors"] = this.authors;
//     data["Rating"] = this.rating;
//     data["RatingDist2"] = this.ratingDist2;
//     data["RatingDist5"] = this.ratingDist5;
//     data["ISBN"] = this.isbn;
//     data["RatingDist3"] = this.ratingDist3;
//     return data;
//   }
// }
