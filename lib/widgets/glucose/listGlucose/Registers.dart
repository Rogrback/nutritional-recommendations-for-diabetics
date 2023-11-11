import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class Registers extends StatelessWidget {
  const Registers({super.key});

  @override
  Widget build(BuildContext context) {

    final year = DateTime.now().year;
    final month = DateTime.now().month;
    final day = DateTime.now().day;
    final hour = DateTime.now().hour;
    final minute = DateTime.now().minute;
    final second = DateTime.now().second;
    final fullTime = "$day-$month-$year $hour:$minute:$second";

    // final format = DateFormat.yMd('es_PE');
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
  //   now.millisecondsSinceEpoch,
  //   location: getLocation(timeZone),
  // );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      child: Container(
        child:  Column(
              children: [
                const Text(
                  'Nivel de glucosa en sangre (mg/dL)',
                  style: TextStyle(fontSize: 20),
                ),
                const Text(
                  '120',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  fullTime.toString(),
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
            
      ),
    );
  }
}