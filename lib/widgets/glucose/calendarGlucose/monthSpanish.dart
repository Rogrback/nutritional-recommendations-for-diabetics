String monthTranslate(String monthName) {
  switch (monthName) {
    case 'January':
      return 'Enero';
    case 'February':
      return 'Febrero';
    case 'March':
      return 'Marzo';
    case 'April':
      return 'Abril';
    case 'May':
      return 'Mayo';
    case 'June':
      return 'Junio';
    case 'July':
      return 'Julio';
    case 'August':
      return 'Agosto';
    case 'September':
      return 'Septiembre';
    case 'October':
      return 'Octubre';
    case 'November':
      return 'Noviembre';
    case 'December':
      return 'Diciembre';
    default:
      return monthName;
  }
}