handleDotSep(data) {
  String updatedValue = '';
  int c = 0;
  for (int i = 0; i < data.length; i++) {
    c += 1;
    updatedValue = updatedValue + data[i];
    if (c % 2 == 0 && i != data.length - 1) {
      updatedValue = updatedValue + ',';
      c = 0;
    }
  }
  return String.fromCharCodes(updatedValue.runes.toList().reversed);
}
