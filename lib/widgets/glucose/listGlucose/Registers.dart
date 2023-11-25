import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:timezone/browser.dart' as tz;
class Registers extends StatelessWidget {

  final int glucose;
  final String medicationMoment;
  final String date;


  const Registers({
    super.key,
    required this.glucose,
    required this.medicationMoment,
    required this.date
    });

  @override
  Widget build(BuildContext context) {

    final today = DateTime.now();
    final name = DateTime.now().timeZoneName;
    final offset = DateTime.now().timeZoneOffset;
    print('today: $today');
    print('timezonename: $name');
    print('timezoneoffset: $offset');
    // final year = DateTime.now().year;
    // final month = DateTime.now().month;
    // final day = DateTime.now().day;
    // final hour = DateTime.now().hour;
    // final minute = DateTime.now().minute;
    // final second = DateTime.now().second;
    // final fullTime = "$day-$month-$year $hour:$minute:$second";
    final ttoday = DateFormat("dd-MM-yy").format(today);
    // final todayperu = DateFormat.yMMMMd('es_PE').format(today);

    // final dateString = format.format(DateTime.now());

    // // Obtén la zona horaria de Perú (America/Lima).
    // final peruTimeZone = getLocation('America/Lima');

    // // Obtén la hora actual en la zona horaria local.
    // DateTime nowLocal = DateTime.now();

    // // Convierte la hora actual a la zona horaria de Perú.
    // TZDateTime peruTime = TZDateTime.from(nowLocal, peruTimeZone);

    // // Formatea la hora en el formato deseado.
    // String formattedTime = DateFormat('HH:mm:ss dd/MM/yyyy').format(peruTime);


    // Intl.defaultLocale = 'es_PE';	
    // final finaldate= DateFormat.jm().format(DateTime.now());

    // print("XXXXXXXXXXXXXXXXXX $finaldate "); // true

    // Obtén la fecha y hora actual
  // DateTime now = DateTime.now();

  // // Define la zona horaria de Perú (en este caso, 'America/Lima')
    // String timeZone = 'America/Lima';

    // Convierte la fecha y hora actual a la zona horaria de Perú
    // ZonedDateTime peruDateTime = ZonedDateTime.fromMillisecondsSinceEpoch(
      // now.millisecondsSinceEpoch,
      // location: getLocation(timeZone),
    // );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListTile(
        title: Column(
          children: [
            const Text(
              'Nivel de Glucosa (mg/dL)',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 23)
            ),
            Text(
              '$glucose',
              style: const TextStyle(
                // color: Colors.white,
                // backgroundColor: Colors.tealAccent,
                fontSize: 23
              )
            )
          ],
        ),
        subtitle: Column(
          children: [
            Text('Momento de medición: $medicationMoment'),
            Text('Fecha: $date'),
          ]
        ),
      ),
    );
  }
}