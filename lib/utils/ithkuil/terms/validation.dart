enum Validation {
  /// The Observational Validation
  obs,

  /// The Recollective Validation
  rec,

  /// The Purportive Validation
  pup,

  /// The Reportive Validation
  rpr,

  /// The Unspecified Validation
  usp,

  /// The Imaginary Validation
  ima,

  /// The Conventional Validation
  cvn,

  /// The Intuitive Validation
  itu,

  /// The Inferential Validation
  inf;

  String path() {
    return switch (this) {
      obs =>
        "M 0.00 -11.20 Q -5.00 0.94 -10.00 0.00 L -10.00 10.00 7.50 -7.50 6.30 -8.70 0.00 -2.40 0.00 -11.20 Z",
      rec =>
        "M -32.40 10.05 Q -22.19 3.33 -16.35 16.35 L 0.00 0.00 0.00 -10.45 Q -4.80 -0.95 -10.00 -5.65 L -10.00 7.70 Q -20.79 -5.41 -32.40 10.05 Z",
      pup =>
        "M 12.55 13.30 Q 18.53 -3.46 6.35 -8.65 L 0.00 -2.30 0.00 -10.40 Q -4.80 -0.90 -10.00 -5.60 L -10.00 10.05 0.00 0.00 Q 12.70 -0.52 12.55 13.30 Z",
      rpr =>
        "M 0.00 0.00 L 0.00 -5.00 Q -4.75 -0.45 -10.00 -3.50 L -10.00 7.60 -17.50 15.15 Q 3.79 16.22 1.95 25.40 10.29 12.14 -8.85 8.80 L 0.00 0.00 Z",
      ima =>
        "M 6.35 -8.65 L 0.00 -2.30 0.00 -5.40 Q -5.00 1.73 -10.00 -0.75 L -10.00 10.00 0.00 0.00 Q 10.80 13.10 22.45 -2.30 12.20 4.35 6.35 -8.65 Z",
      cvn =>
        "M 0.00 0.00 L 0.00 -10.45 Q -4.80 -0.95 -10.00 -5.65 L -10.00 7.70 Q -23.79 6.85 -19.40 -5.70 -32.93 7.48 -16.35 16.35 L 0.00 0.00 Z",
      itu =>
        "M 10.00 7.65 Q 0.20 23.65 -17.50 15.15 L -10.00 7.60 -10.00 -3.50 Q -4.75 -0.45 0.00 -5.00 L 0.00 0.00 -8.85 8.80 Q -1.70 14.95 10.00 7.65 Z",
      inf =>
        "M -10.00 -5.00 L -10.00 10.00 2.60 10.00 -4.90 17.50 -3.70 18.70 15.00 0.00 0.00 0.00 0.00 -10.00 Q -3.85 -2.25 -10.00 -5.00 Z",
      usp =>
        "M -17.50 15.10 L -16.30 16.30 0.00 0.00 0.00 -7.75 Q -5.00 1.69 -10.00 -1.20 L -10.00 7.60 -17.50 15.10 Z"
    };
  }
}
