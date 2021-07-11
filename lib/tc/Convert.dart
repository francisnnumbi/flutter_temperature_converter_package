import 'package:temperature_converter/tc/Index.dart';

import 'Temperature.dart';

class Convert {
  static double celciusTO(Temperature temp, double c) {
    switch (temp) {
      case Temperature.FAHRENHEIT:
        return (c * 9 / 5) + Index.FAHRENHEIT;
      case Temperature.KELVIN:
        return c + Index.KELVIN;
      case Temperature.RANKINE:
        return (c * 1.8) + Index.FAHRENHEIT + Index.RANKINE;
      case Temperature.REAUMUR:
        return c * 0.8;
      default:
        return c;
    }
  }

  static double fahrenheitTO(Temperature temp, double f) {
    switch (temp) {
      case Temperature.CELCIUS:
        return (f - Index.FAHRENHEIT) * 5 / 9;
      case Temperature.KELVIN:
        return fahrenheitTO(Temperature.CELCIUS, f) + Index.KELVIN;
      case Temperature.RANKINE:
        return f + Index.RANKINE;
      case Temperature.REAUMUR:
        return (f - Index.FAHRENHEIT) / 2.25;
      default:
        return f;
    }
  }

  static double kelvinTO(Temperature temp, double k) {
    switch (temp) {
      case Temperature.CELCIUS:
        return k - Index.KELVIN;
      case Temperature.FAHRENHEIT:
        return (kelvinTO(Temperature.CELCIUS, k) * 9 / 5) + Index.KELVIN;
      case Temperature.RANKINE:
        return k * 1.8;
      case Temperature.REAUMUR:
        return kelvinTO(Temperature.CELCIUS, k) * 0.8;
      default:
        return k;
    }
  }

  static double rankineTO(Temperature temp, double ra) {
    switch (temp) {
      case Temperature.CELCIUS:
        return (rankineTO(Temperature.FAHRENHEIT, ra) - Index.FAHRENHEIT) / 1.8;
      case Temperature.FAHRENHEIT:
        return ra - Index.RANKINE;
      case Temperature.KELVIN:
        return ra / 1.8;
      case Temperature.REAUMUR:
        return (rankineTO(Temperature.FAHRENHEIT, ra) - Index.FAHRENHEIT) /
            2.25;
      default:
        return ra;
    }
  }

  static double reaumurTO(Temperature temp, double re) {
    switch (temp) {
      case Temperature.CELCIUS:
        return re * 1.25;
      case Temperature.FAHRENHEIT:
        return (re * 2.25) + Index.FAHRENHEIT;
      case Temperature.KELVIN:
        return reaumurTO(Temperature.CELCIUS, re) + Index.KELVIN;
      case Temperature.RANKINE:
        return reaumurTO(Temperature.FAHRENHEIT, re) + Index.RANKINE;
      default:
        return re;
    }
  }

  static double convert(Temperature from, Temperature to, double degree) {
    switch (from) {
      case Temperature.CELCIUS:
        return celciusTO(to, degree);
      case Temperature.FAHRENHEIT:
        return fahrenheitTO(to, degree);
      case Temperature.KELVIN:
        return kelvinTO(to, degree);
      case Temperature.RANKINE:
        return rankineTO(to, degree);
      case Temperature.REAUMUR:
        return reaumurTO(to, degree);
      default:
        return celciusTO(to, degree);
    }
  }
}
