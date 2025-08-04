String generateSlug(String input) {
  return input
      .toLowerCase()
      .replaceAll(RegExp(r"[^\w\s]+"), '')
      .replaceAll(' ', '_');
}
