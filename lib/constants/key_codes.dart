// ignore_for_file: constant_identifier_names

/// Códigos de tecla para Samsung Smart TV
/// Cada código corresponde a una función específica del control remoto Samsung
enum KeyCodes {
  // === NAVEGACIÓN Y MENÚS ===
  KEY_MENU,           // Para navegar al menú principal
  KEY_TOPMENU,        // Para acceder al menú superior
  KEY_HOME,           // Para ir al inicio/pantalla principal
  KEY_RETURN,         // Para retroceder/volver atrás
  KEY_BACK_MHP,       // Para retroceder en MHP
  KEY_ALT_MHP,        // Alternativa MHP
  
  // === NAVEGACIÓN DIRECCIONAL ===
  KEY_UP,             // Flecha hacia arriba
  KEY_DOWN,           // Flecha hacia abajo
  KEY_LEFT,           // Flecha hacia la izquierda
  KEY_RIGHT,          // Flecha hacia la derecha
  KEY_ENTER,          // Confirmar/seleccionar
  
  // === TECLADO NUMÉRICO ===
  KEY_0,              // Número 0
  KEY_1,              // Número 1
  KEY_2,              // Número 2
  KEY_3,              // Número 3
  KEY_4,              // Número 4
  KEY_5,              // Número 5
  KEY_6,              // Número 6
  KEY_7,              // Número 7
  KEY_8,              // Número 8
  KEY_9,              // Número 9
  KEY_PLUS100,        // Para canales +100 (ej: 101, 102, etc.)
  
  // === CONTROL DE VOLUMEN ===
  KEY_VOLUP,          // Subir volumen
  KEY_VOLDOWN,        // Bajar volumen
  KEY_MUTE,           // Silenciar/activar sonido
  
  // === CONTROL DE CANALES ===
  KEY_CHUP,           // Subir canal
  KEY_CHDOWN,         // Bajar canal
  KEY_PRECH,          // Canal previo
  KEY_FAVCH,          // Canales favoritos
  KEY_CH_LIST,        // Lista de canales
  
  // === BOTONES DE COLOR ===
  KEY_RED,            // Botón rojo
  KEY_GREEN,          // Botón verde
  KEY_YELLOW,         // Botón amarillo
  KEY_CYAN,           // Botón azul/cian
  
  // === CONTROL DE FUENTE/ENTRADA ===
  KEY_SOURCE,         // Cambiar fuente de entrada
  KEY_TV,             // Modo TV
  KEY_DTV,            // TV digital
  KEY_DVD_MODE,       // Modo DVD
  KEY_VCR_MODE,       // Modo VCR
  KEY_CATV_MODE,      // Modo CATV
  KEY_DSS_MODE,       // Modo DSS
  KEY_STB_MODE,       // Modo STB
  
  // === CONTROL DE MEDIOS ===
  KEY_PLAY,           // Reproducir
  KEY_PAUSE,          // Pausar
  KEY_STOP,           // Detener
  KEY_REWIND,         // Rebobinar
  KEY_FF,             // Avanzar rápido
  KEY_REC,            // Grabar
  KEY_QUICK_REPLAY,   // Reproducción rápida
  KEY_INSTANT_REPLAY, // Repetición instantánea
  KEY_STILL_PICTURE,  // Imagen fija
  
  // === CONTROL DE POTENCIA ===
  KEY_POWER,          // Encender/apagar TV
  KEY_POWEROFF,       // Apagar TV
  KEY_POWERON,        // Encender TV
  KEY_SLEEP,          // Modo suspensión
  
  // === INFORMACIÓN Y AYUDA ===
  KEY_INFO,           // Mostrar información
  KEY_HELP,           // Ayuda
  KEY_GUIDE,          // Guía de programación
  
  // === CONTROL DE IMAGEN ===
  KEY_PICTURE_SIZE,   // Tamaño de imagen
  KEY_ASPECT,         // Relación de aspecto
  KEY_ZOOM1,          // Zoom 1
  KEY_ZOOM2,          // Zoom 2
  KEY_ZOOM_IN,        // Acercar zoom
  KEY_ZOOM_OUT,       // Alejar zoom
  KEY_ZOOM_MOVE,      // Mover zoom
  KEY_PANORAMA,       // Vista panorámica
  KEY_4_3,            // Formato 4:3
  KEY_16_9,           // Formato 16:9
  
  // === CONTROL DE SONIDO ===
  KEY_MTS,            // Sistema de sonido MTS
  KEY_SRS,            // Sistema de sonido SRS
  KEY_DNSe,           // Sistema de sonido DNSe
  KEY_CONVERT_AUDIO_MAINSUB, // Convertir audio principal/sub
  
  // === CONTROL DE SUBTÍTULOS ===
  KEY_CAPTION,        // Subtítulos
  KEY_SUB_TITLE,      // Subtítulo
  KEY_TTX_MIX,        // Mezcla TTX
  KEY_TTX_SUBFACE,    // Superficie TTX
  
  // === CONTROL DE PIP (Picture in Picture) ===
  KEY_PIP_ONOFF,      // Activar/desactivar PIP
  KEY_PIP_SWAP,       // Intercambiar PIP
  KEY_PIP_SIZE,       // Tamaño PIP
  KEY_PIP_SCAN,       // Escanear PIP
  KEY_PIP_CHUP,       // Subir canal PIP
  KEY_PIP_CHDOWN,     // Bajar canal PIP
  
  // === CONTROL DE HERRAMIENTAS ===
  KEY_TOOLS,          // Herramientas
  KEY_CLEAR,          // Limpiar
  KEY_ADDDEL,         // Agregar/eliminar
  KEY_PRINT,          // Imprimir
  KEY_BOOKMARK,       // Marcador
  
  // === CONTROL DE DISPOSITIVOS ===
  KEY_DEVICE_CONNECT, // Conectar dispositivo
  KEY_DISC_MENU,      // Menú de disco
  KEY_DVR_MENU,       // Menú DVR
  KEY_DVR,            // DVR
  
  // === CONTROL DE ENTRADAS ===
  KEY_AV1,            // Entrada AV1
  KEY_AV2,            // Entrada AV2
  KEY_AV3,            // Entrada AV3
  KEY_SVIDEO1,        // Entrada S-Video1
  KEY_SVIDEO2,        // Entrada S-Video2
  KEY_SVIDEO3,        // Entrada S-Video3
  KEY_COMPONENT1,     // Entrada Componente1
  KEY_COMPONENT2,     // Entrada Componente2
  KEY_DVI,            // Entrada DVI
  KEY_HDMI,           // Entrada HDMI
  KEY_HDMI1,          // Entrada HDMI1
  KEY_HDMI2,          // Entrada HDMI2
  KEY_HDMI3,          // Entrada HDMI3
  KEY_HDMI4,          // Entrada HDMI4
  
  // === CONTROL DE APLICACIONES ===
  KEY_APP_LIST,       // Lista de aplicaciones
  KEY_CONTENTS,       // Contenidos
  KEY_ENTERTAINMENT,  // Entretenimiento
  KEY_LIVE,           // En vivo
  
  // === CONTROL DE RED ===
  KEY_W_LINK,         // Enlace W
  KEY_DTV_LINK,       // Enlace DTV
  KEY_ANYNET,         // AnyNet
  KEY_ANYVIEW,        // AnyView
  KEY_LINK,           // Enlace
  
  // === CONTROL DE CONFIGURACIÓN ===
  KEY_PMODE,          // Modo P
  KEY_AUTO_PROGRAM,   // Programación automática
  KEY_FACTORY,        // Configuración de fábrica
  KEY_AUTO_FORMAT,    // Formato automático
  
  // === CONTROL DE CALIDAD DE IMAGEN ===
  KEY_DYNAMIC,        // Modo dinámico
  KEY_STANDARD,       // Modo estándar
  KEY_MOVIE1,         // Modo película 1
  KEY_CUSTOM,         // Modo personalizado
  KEY_MAGIC_BRIGHT,   // Brillo mágico
  KEY_PERPECT_FOCUS,  // Enfoque perfecto
  
  // === CONTROL DE TIEMPO ===
  KEY_CLOCK_DISPLAY,  // Mostrar reloj
  KEY_SETUP_CLOCK_TIMER, // Configurar temporizador de reloj
  
  // === CONTROL DE JUEGOS ===
  KEY_GAME,           // Modo juego
  
  // === CONTROL DE RADIO ===
  KEY_FM_RADIO,       // Radio FM
  
  // === CONTROL DE IDENTIFICACIÓN ===
  KEY_ID_INPUT,       // Entrada de ID
  KEY_ID_SETUP,       // Configuración de ID
  KEY_DNIe,           // DNIe
  
  // === CONTROL DE EFECTOS ===
  KEY_SEFFECT,        // Efecto de sonido
  KEY_MDC,            // MDC
  
  // === CONTROL DE SEÑAL ===
  KEY_DTV_SIGNAL,     // Señal DTV
  KEY_ANTENA,         // Antena
  KEY_CONVERGENCE,    // Convergencia
  
  // === CONTROL DE PANEL ===
  KEY_PANNEL_POWER,   // Panel de potencia
  KEY_PANNEL_CHUP,    // Panel subir canal
  KEY_PANNEL_CHDOWN,  // Panel bajar canal
  KEY_PANNEL_VOLUP,   // Panel subir volumen
  KEY_PANNEL_VOLDOW,  // Panel bajar volumen
  KEY_PANNEL_ENTER,   // Panel entrar
  KEY_PANNEL_MENU,    // Panel menú
  KEY_PANNEL_SOURCE,  // Panel fuente
  
  // === CONTROL DE MODO ===
  KEY_3SPEED,         // Velocidad 3
  KEY_RSURF,          // RSURF
  KEY_PROGRAM,        // Programa
  KEY_REPEAT,         // Repetir
  KEY_DOOR,           // Puerta
  KEY_OPEN,           // Abrir
  KEY_WHEEL_LEFT,     // Rueda izquierda
  KEY_WHEEL_RIGHT,    // Rueda derecha
  KEY_ESAVING,        // Ahorro de energía
  KEY_MS,             // MS
  KEY_MORE,           // Más
  
  // === CONTROL DE ÁNGULO ===
  KEY_ANGLE,          // Ángulo
  
  // === CONTROL DE RESERVADO ===
  KEY_RESERVED1,      // Reservado 1
  
  // === CONTROL DE VCHIP ===
  KEY_VCHIP,          // V-Chip
  
  // === CONTROL DE LLAMADAS ===
  KEY_CALLER_ID,      // ID de llamada
  
  // === CONTROL DE ESCALA ===
  KEY_SCALE,          // Escala
  
  // === CONTROL DE DNET ===
  KEY_DNET,           // DNET
  
  // === CONTROL DE MICRÓFONO ===
  KEY_MIC,            // Micrófono
  
  // === CONTROL DE RSS ===
  KEY_RSS,            // RSS
  
  // === CONTROL DE AUTO ARC ===
  KEY_AUTO_ARC_RESET, // Reset automático ARC
  KEY_AUTO_ARC_LNA_ON, // LNA automático ON
  KEY_AUTO_ARC_LNA_OFF, // LNA automático OFF
  KEY_AUTO_ARC_ANYNET_MODE_OK, // Modo AnyNet OK
  KEY_AUTO_ARC_ANYNET_AUTO_START, // Inicio automático AnyNet
  KEY_AUTO_ARC_CAPTION_ON, // Subtítulos automáticos ON
  KEY_AUTO_ARC_CAPTION_OFF, // Subtítulos automáticos OFF
  KEY_AUTO_ARC_PIP_DOUBLE, // PIP doble automático
  KEY_AUTO_ARC_PIP_LARGE, // PIP grande automático
  KEY_AUTO_ARC_PIP_SMALL, // PIP pequeño automático
  KEY_AUTO_ARC_PIP_WIDE, // PIP ancho automático
  KEY_AUTO_ARC_PIP_LEFT_TOP, // PIP izquierda arriba automático
  KEY_AUTO_ARC_PIP_RIGHT_TOP, // PIP derecha arriba automático
  KEY_AUTO_ARC_PIP_LEFT_BOTTOM, // PIP izquierda abajo automático
  KEY_AUTO_ARC_PIP_RIGHT_BOTTOM, // PIP derecha abajo automático
  KEY_AUTO_ARC_PIP_CH_CHANGE, // Cambio canal PIP automático
  KEY_AUTO_ARC_AUTOCOLOR_SUCCESS, // Color automático exitoso
  KEY_AUTO_ARC_AUTOCOLOR_FAIL, // Color automático fallido
  KEY_AUTO_ARC_C_FORCE_AGING, // Envejecimiento forzado C
  KEY_AUTO_ARC_USBJACK_INSPECT, // Inspección jack USB
  KEY_AUTO_ARC_JACK_IDENT, // Identificación jack
  KEY_AUTO_ARC_CAPTION_KOR, // Subtítulos coreanos automáticos
  KEY_AUTO_ARC_CAPTION_ENG, // Subtítulos ingleses automáticos
  KEY_AUTO_ARC_PIP_SOURCE_CHANGE, // Cambio fuente PIP automático
  KEY_AUTO_ARC_ANTENNA_AIR, // Antena aire automática
  KEY_AUTO_ARC_ANTENNA_CABLE, // Antena cable automática
  KEY_AUTO_ARC_ANTENNA_SATELLITE, // Antena satélite automática
  
  // === CONTROL DE SEPARACIÓN ===
  KEY_NINE_SEPERATE,  // Separación de nueve
  
  // === CONTROL DE EXTENSIONES ===
  KEY_EXT1,           // Extensión 1
  KEY_EXT2,           // Extensión 2
  KEY_EXT3,           // Extensión 3
  KEY_EXT4,           // Extensión 4
  KEY_EXT5,           // Extensión 5
  KEY_EXT6,           // Extensión 6
  KEY_EXT7,           // Extensión 7
  KEY_EXT8,           // Extensión 8
  KEY_EXT9,           // Extensión 9
  KEY_EXT10,          // Extensión 10
  KEY_EXT11,          // Extensión 11
  KEY_EXT12,          // Extensión 12
  KEY_EXT13,          // Extensión 13
  KEY_EXT14,          // Extensión 14
  KEY_EXT15,          // Extensión 15
  KEY_EXT16,          // Extensión 16
  KEY_EXT17,          // Extensión 17
  KEY_EXT18,          // Extensión 18
  KEY_EXT19,          // Extensión 19
  KEY_EXT20,          // Extensión 20
  KEY_EXT21,          // Extensión 21
  KEY_EXT22,          // Extensión 22
  KEY_EXT23,          // Extensión 23
  KEY_EXT24,          // Extensión 24
  KEY_EXT25,          // Extensión 25
  KEY_EXT26,          // Extensión 26
  KEY_EXT27,          // Extensión 27
  KEY_EXT28,          // Extensión 28
  KEY_EXT29,          // Extensión 29
  KEY_EXT30,          // Extensión 30
  KEY_EXT31,          // Extensión 31
  KEY_EXT32,          // Extensión 32
  KEY_EXT33,          // Extensión 33
  KEY_EXT34,          // Extensión 34
  KEY_EXT35,          // Extensión 35
  KEY_EXT36,          // Extensión 36
  KEY_EXT37,          // Extensión 37
  KEY_EXT38,          // Extensión 38
  KEY_EXT39,          // Extensión 39
  KEY_EXT40,          // Extensión 40
  KEY_EXT41           // Extensión 41
}
