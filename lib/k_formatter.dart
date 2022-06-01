String kFormatter(String input) {
	int num = int.parse(input);
	int sign = num.sign;
	int abs = num.abs();

	if (abs > 999) {
	  return "${(sign * (abs/1000)).toStringAsFixed(1)}k";
	}

	return abs.toString();
}
