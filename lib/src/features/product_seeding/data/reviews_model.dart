class Review {
  final String image; 
  final String name; 
  final int numOfStars; 
  final String review; 
  final String time;

  Review({
    required this.image,
    required this.name,
    required this.numOfStars,
    required this.review,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'numOfStars': numOfStars,
      'review': review,
      'time': time, 
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      image: map['image'] ?? '',
      name: map['name'] ?? '',
      numOfStars: map['numOfStars'] ?? 0,
      review: map['review'] ?? '',
      time: map['time'] ?? '',
    );
  }
}
