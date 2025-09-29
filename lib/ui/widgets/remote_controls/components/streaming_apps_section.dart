import 'package:flutter/material.dart';
import 'package:remote/core/interfaces/tv_interface.dart';
import 'package:remote/constants/key_codes.dart';

class StreamingAppsSection extends StatelessWidget {
  final TVInterface tv;

  const StreamingAppsSection({
    super.key,
    required this.tv,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Aplicaciones de streaming
          SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildStreamingApp(
                  'Netflix',
                  Colors.red,
                  'N',
                  () => _launchApp('netflix'),
                ),
                const SizedBox(width: 12),
                _buildStreamingApp(
                  'YouTube',
                  Colors.red,
                  '▶',
                  () => _launchApp('youtube'),
                ),
                const SizedBox(width: 12),
                _buildStreamingApp(
                  'Prime Video',
                  Colors.blue,
                  'prime',
                  () => _launchApp('prime'),
                ),
                const SizedBox(width: 12),
                _buildStreamingApp(
                  'Disney+',
                  const Color(0xFF1E1E1E),
                  'Disney+',
                  () => _launchApp('disney'),
                ),
                const SizedBox(width: 12),
                _buildStreamingApp(
                  'Remote TV',
                  Colors.black,
                  'tv',
                  () => _launchApp('appletv'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStreamingApp(String name, Color color, String logo, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  logo,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: name == 'Disney+' ? 12 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _launchApp(String appName) {
    // Mapear nombres de apps a códigos de tecla específicos
    switch (appName) {
      case 'netflix':
        tv.sendKey(KeyCodes.KEY_APP_LIST); // Usar lista de apps como alternativa
        break;
      case 'youtube':
        tv.sendKey(KeyCodes.KEY_APP_LIST); // Usar lista de apps como alternativa
        break;
      case 'prime':
        tv.sendKey(KeyCodes.KEY_APP_LIST); // Usar lista de apps como alternativa
        break;
      case 'disney':
        tv.sendKey(KeyCodes.KEY_APP_LIST); // Usar lista de apps como alternativa
        break;
      case 'appletv':
        tv.sendKey(KeyCodes.KEY_APP_LIST); // Usar lista de apps como alternativa
        break;
      default:
        tv.sendKey(KeyCodes.KEY_HOME);
    }
  }
}
