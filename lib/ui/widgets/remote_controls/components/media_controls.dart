 import 'package:flutter/material.dart';
import 'package:remote/constants/key_codes.dart';
import 'package:remote/core/interfaces/tv_interface.dart';
import 'package:remote/ui/widgets/remote_controls/components/circular_button_component.dart';

class MediaControls extends StatelessWidget {
  final TVInterface tv;
  const MediaControls({
    super.key, required this.tv,
  });
  
  Color get iconColor => Colors.white54;
  double get size => 55;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Sección de Grabación de Pantalla
        _buildRecordingSection(),
        const SizedBox(height: 20),
        // Sección de Controles de Reproducción
        _buildPlaybackSection(),
      ],
    );
  }

  Widget _buildRecordingSection() {
    return Column(
      children: [
        Text(
          'Grabación de Pantalla',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _ScreenRecord(tv: tv, size: size, iconColor: iconColor),
          ],
        ),
      ],
    );
  }

  Widget _buildPlaybackSection() {
    return Column(
      children: [
        Text(
          'Controles de Reproducción',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _Rewind(tv: tv, size: size, iconColor: iconColor),
            _PlayAndPause(tv: tv, size: size, iconColor: iconColor),
            _Stop(tv: tv, size: size, iconColor: iconColor),
            _FastForward(tv: tv, size: size, iconColor: iconColor),
            _Restart(tv: tv, size: size, iconColor: iconColor),
          ],
        ),
      ],
    );
  }
}

// Sección de Grabación
class _ScreenRecord extends StatelessWidget {
  const _ScreenRecord({
    required this.tv,
    required this.size,
    required this.iconColor,
  });

  final TVInterface tv;
  final double size;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return BuildCircularButton(
      icon: Icons.fiber_manual_record,
      onTap: () => tv.sendKey(KeyCodes.KEY_REC),
      tooltip: 'Grabar Pantalla',
      size: size,
      iconColor: Colors.red,
    );
  }
}

// Sección de Reproducción
class _Rewind extends StatelessWidget {
  const _Rewind({
    required this.tv,
    required this.size,
    required this.iconColor,
  });

  final TVInterface tv;
  final double size;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return BuildCircularButton(
      icon: Icons.replay,
      onTap: () => tv.sendKey(KeyCodes.KEY_REWIND),
      tooltip: 'Retroceder',
      size: size,
      iconColor: iconColor,
    );
  }
}

class _PlayAndPause extends StatelessWidget {
  const _PlayAndPause({
    required this.tv,
    required this.size,
    required this.iconColor,
  });

  final TVInterface tv;
  final double size;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return BuildCircularButton(
      icon: Icons.play_arrow,
      onTap: () => tv.sendKey(KeyCodes.KEY_PLAY),
      tooltip: 'Reproducir',
      size: size,
      iconColor: Colors.green,
    );
  }
}

class _Stop extends StatelessWidget {
  const _Stop({
    required this.tv,
    required this.size,
    required this.iconColor,
  });

  final TVInterface tv;
  final double size;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return BuildCircularButton(
      icon: Icons.stop,
      onTap: () => tv.sendKey(KeyCodes.KEY_STOP),
      tooltip: 'Detener',
      size: size,
      iconColor: Colors.red,
    );
  }
}

class _FastForward extends StatelessWidget {
  const _FastForward({
    required this.tv,
    required this.size,
    required this.iconColor,
  });

  final TVInterface tv;
  final double size;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return BuildCircularButton(
      icon: Icons.forward,
      onTap: () => tv.sendKey(KeyCodes.KEY_FF),
      tooltip: 'Avanzar',
      size: size,
      iconColor: iconColor,
    );
  }
}

class _Restart extends StatelessWidget {
  const _Restart({
    required this.tv,
    required this.size,
    required this.iconColor,
  });

  final TVInterface tv;
  final double size;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return BuildCircularButton(
      icon: Icons.refresh,
      onTap: () => tv.sendKey(KeyCodes.KEY_QUICK_REPLAY),
      tooltip: 'Reiniciar',
      size: size,
      iconColor: iconColor,
    );
  }
}
