﻿-- THIS CONTENTS OF THIS FILE IS AUTO-GENERATED BY THE WOWACE PACKAGER
-- Please use the Localization App on WoWAce to update this
-- at http://www.wowace.com/projects/omen-threat-meter/localization/

--  Translation courtesy of Ben (Aesyl - US Tanaris)
local AceLocale = LibStub:GetLibrary("AceLocale-3.0")
local L = AceLocale:NewLocale("Omen", "esES") or AceLocale:NewLocale("Omen", "esMX")
if not L then return end

L["A collection of help pages"] = "Una colección de páginas útiles"
L["Alpha"] = "Transparencia"
L["Always Show Self"] = "Siempre mostrarme "
L["Always show your threat bar on Omen (ignores class filter settings), showing your bar on the last row if necessary"] = "Siempre muestra tu barra de amenaza en Omen (ignora las opciones de filtros de clase), mostrando tu barra en la última fila si es necesario."
L["Ambience"] = "Ambiente"
L["Animate Bars"] = "Animar las barras"
L["Attach to minimap"] = "Adherir a Minimapa"
L["Autocollapse"] = "Autocontraer"
L["Autocollapse Options"] = "Opciones de autocontraer"
L["AUTO_SHOW/HIDE_NOTE"] = "Nota: Si usted muestra/oculta Omen manualmente, éste se mostrará o permanecerá oculto, independientemente de los ajustes de automostrar/ocultar hasta que llegues a la próxima zona, te unas o abandones un grupo o banda, o cambies cualquier ajuste de automostrar/ocultar."
L["Background Color"] = "Color de fondo"
L["Background Options"] = "Opciones de fondo"
L["Background Texture"] = "Textura de fondo"
L["Background Tile Size"] = "Tamaño del mosaico "
L["Bar BG Color"] = "Color de fondo de las barras"
L["Bar Height"] = "Altura de la barra"
L["Bar Inset"] = "Recuadro de la barra"
L["Bar Label Options"] = "Opciones de las etiquetas de las barras"
L["Bar Settings"] = "Opciones de barra"
L["Bar Spacing"] = "Espacio entre barras"
L["Bar Texture"] = "Textura de barra"
L["Border Color"] = "Color de borde"
L["Border Texture"] = "Textura de borde"
L["Border Thickness"] = "Grosor de borde"
L["Causes Omen to play a chosen sound effect"] = "Hace que Omen reproduzca un efecto de sonido elegido."
L["Causes the entire game world to shake momentarily. This option only works if nameplates are turned off."] = "Hace que toda la pantalla del juego tiemble brevemente. Esta opción sólo funciona si las placas de nombre están desactivadas."
L["Causes the entire screen to flash red momentarily"] = "Hace que la pantalla entera destelle de rojo brevemente."
L["Center"] = "Centro"
L["Center Omen"] = "Centrar Omen"
L["|cffff0000Error:|r Omen cannot use shake warning if you have turned on nameplates at least once since logging in."] = "|cffff0000Error:|r Omen no puede usar el aviso de sacudida si ha activado las placas de nombre al menos una vez desde que ha iniciado."
L["Clamp To Screen"] = "Anclar a la pantalla"
L["Click|r to toggle the Omen window"] = "Haz clic|r para mostrar/ocultar la ventana de Omen"
L["Click Through"] = "Clic a través"
L["Collapse to show a minimum number of bars"] = "Contrae para mostrar un número reducido de barras."
L["Configure"] = "Configurar"
L["Configure bar settings."] = "Configurar las opciones de barra."
L["Configure title bar settings."] = "Configurar opciones de la barra de título."
L["Controls the frame strata of the main Omen window. Default: MEDIUM"] = "Controla la capa del marco de la ventana principal de Omen. Por defecto: MEDIUM"
L["Controls the scaling of the main Omen window."] = "Controla la escala de la ventana principal de Omen."
L["Controls the transparency of the main Omen window."] = "Controla la transparencia de la ventana principal de Omen."
L["Controls whether the main Omen window can be dragged offscreen"] = "Controla si la ventana principal de Omen puede ser movida fuera de la pantalla."
L["Control the font size of the labels"] = "Controla el tamaño de la fuente de las etiquetas."
L["Control the font size of the title text"] = "Controla el tamaño de la fuente del texto del título."
L["DEATHKNIGHT"] = "Caballero de la Muerte"
L["Disable while tanking"] = "Desactivar de tanque"
L["DISABLE_WHILE_TANKING_DESC"] = "No dará ninguna alerta si Actitud defensiva, Forma de oso, Furia recta o Presencia de Sangre está activo."
L["Display large numbers in Ks"] = "Muestra los números grandes en Ks."
L["DRUID"] = "Druida"
L["Enable Screen Flash"] = "Destello de pantalla"
L["Enable Screen Shake"] = "Sacudida de pantalla"
L["Enable Sound"] = "Activar sonido"
L["Enable Warning Message"] = "Mensaje de aviso"
L["FAQ Part 1"] = "FAQ parte 1"
L["FAQ Part 2"] = "FAQ parte 2"
L["Font"] = "Fuente"
L["Font Color"] = "Color de fuente"
L["Font Outline"] = "Borde de fuente"
L["Font Size"] = "Tamaño de fuente"
L["Frame's background color"] = "Color del fondo del marco."
L["Frame's border color"] = "Color del borde del marco."
L["Frame Strata"] = "Capa del marco"
L["Frequently Asked Questions"] = "Preguntas frecuentes (FAQ)"
L["FuBar Options"] = "Opciones de FuBar"
L["GENERAL_FAQ"] = [=[|cffffd200¿Qué diferencias hay entre Omen3 y Omen2?|r

Omen3 cuenta completamente con el API de amenaza de Blizzard y eventos de amenaza. A diferencia de Omen2, no trata de calcular o extrapolar la amenaza.

Omen2 era lo que llamábamos la biblioteca Threat-2.0. Esta biblioteca era responsable de observar el diario de combate, hechizos, ventajas, desventajas, actitudes, talentos y modificadores de equipo para calcular la amenaza de cada una individualmente. La amenaza se calculaba basándose en informaciones conocidas o aproximaciones de conductas observadas. Muchas informaciones, como los golpes por la espalda, se basaban en suposiciones.

La biblioteca Threat-2.0 también incluía comunicación para transmitir su amenaza al resto de la banda mientras usaran también Threat-2.0. Esta información era usada para dar una muestra de información de amenaza que incluyera la banda entera.

Desde el parche 3.0.2, Omen ya no hace estas cosas y una biblioteca de amenaza ya no es necesaria. Omen3 usa el monitor de amenaza de Blizzard para obtener los valores exactos de la amenaza de cada miembro. Esto significa que Omen3 no necesita sincronización de datos, analizar el diario de combate o intentar adivinar. Esto conlleva un aumento significativo en rendimiento con respecto al tráfico de red, uso de la CPU y de la memoria. La implementación de módulos por jefes específicos ya no es necesaria.

Además esta implementación nueva permite la adición de la amenaza de NPCs. Sin embargo, hay desventajas; las actualizaciones son menos frecuentes, los detalles de amenaza no pueden obtenerse a menos que alguien en su banda esté apuntando al enemigo, y no es posible obtener amenaza de un enemigo con el que usted no está en combate.

|cffffd200¿Cómo me deshago de las 2 líneas verticales de color gris de la mitad?|r

Bloquea tu Omen. Bloquear Omen evita que sea movido o reescalado, como también previene que el tamaño de las columnas sea cambiado. Si no realizas esto, las 2 líneas grises verticales seguirán ahí para poder cambiar las columnas manualmente.

|cffffd200¿Cómo hago que Omen3 se parezca a Omen2?|r

Cambia la textura de fondo y textura de borde a "Blizzard Tooltip", cambia el color de fondo a negro (arrastra hacia abajo la barra de luminosidad), y el color de borde a azul.

|cffffd200¿Por qué no me muestra la amenaza en un enemigo cuándo lo apunto, aun cuando él está en combate?|r

El API de amenaza de Blizzard no devuelve datos de amenaza de un enemigo con el que no estás en combate directamente, porque no estarás en su lista de amenaza. Creemos que esto es un esfuerzo para reducir tráfico de red.

|cffffd200¿Hay forma de sortear esta limitación de Blizzard? No poder ver la amenaza de mi mascota antes de que yo ataque me obliga a especular.|r

No hay forma de sortear esta limitación excepto que nosotros especulemos por ti (que es exactamente lo que hacía Omen2).

El objetivo de Omen3 es proveer información fiable sobre la amenaza, ya no intentamos especular por ti y en el camino reducir tus FPS. Ten algo de confianza en tu mascota/tanque, o sólo espera 2 segundos antes de atacar y usa un hechizo de poco daño como Lanza de Hielo para que puedas obtener unas lecturas iniciales de amenaza.
]=]
L["GENERAL_FAQ2"] = [=[|cffffd200¿Podemos obtener de nuevo el modo de AOE?|r 

De nuevo, esto no es realmente posible sin adivinar valores de amenaza. La API de amenaza de Blizzard sólo nos permite consultar datos sobre la amenaza de las unidades que alguien de la banda este seleccionando. Esto significa que si hay 20 enemigos y sólo 6 de ellos son seleccionados por la banda, no hay manera de obtener datos exactos sobre la amenaza de los otros 14.

Esto también es extremadamente complicado de adivinar sobre todo para la curación y beneficios (la amenaza se divide por el número de enemigos que están en combate), ya que los enemigos que se encuentran bajo efectos de control de masas (oveja, desterrar, porrazo, etc.) no tienen su tabla de amenaza modificados y el Addon no puede saber con fiabilidad el número de enemigos que están en combate. El adivinar de Omen2 es casi siempre equivocado. 

|cffffd200Las ventanas emergentes al pasar el ratón por encima de una unidad muestra un % de amenaza que no coincide con el % de amenaza reportado por Omen3. ¿Por qué?|r

El porcentaje de amenaza de Blizzard se escala de 0% a 100%, por lo que siempre muestra agresividad en un 100%. Omen informa de los valores sin escala primas que tira porcentajes de agresividad al 110%, en combate cuerpo a cuerpo y 130% de otra manera.

Por acuerdo universal, el objetivo principal de un grupo atraído por el tanque se define en 100% de amenaza.

|cffffd200¿Hace Omen3 sincronización o analiza el registro de combate?|r

No. Omen3 no intenta sincronizar o analizar el registro de combate. De momento no hay intenciones de hacerlo.

|cffffd200Las actualizaciones de Omen son lentas...|r

Omen3 actualiza los valores de amenaza que se ven tan a menudo como Blizzard actualiza los valores de amenaza para nosotros.

De hecho, Blizzard actualiza aproximadamente una vez por segundo, que es mucho más rápido que lo que Omen2 usaba para sincronizar las actualizaciones. En Omen2, sólo transmitía su amenaza para el resto de la banda una vez cada 3 segundos (o 1.5 seg si es un tanque). 

|cffffd200¿Dónde puedo reportar errores o hacer sugerencias?|r

http://forums.wowace.com/showthread.php?t=14249 

|cffffd200¿Quién diseñó Omen3?|r

El diseñador principal de Omen es Xinhuan (Reino Blackrock/Barthilas de EE.UU., Alianza). 

|cffffd200¿Aceptan donaciones de Paypal?|r

Sí, por favor, envíalas a Xinhuan@Gmail.com.]=]
L["General Settings"] = "Opciones generales"
L["Grow bars upwards"] = "Crecer hacia arriba"
L["Heading background color"] = "Color de fondo de categorías"
L["Heading BG Color"] = "Color de fondo de categorías"
L["Height of each bar"] = "Altura de cada barra"
L["Height of the title bar. The minimum height allowed is twice the background border thickness."] = "Altura de la barra de título. La altura mínima permitida es el doble del grosor del borde del fondo."
L["Help File"] = "Archivo de ayuda"
L["Hide minimap/FuBar icon"] = "Ocultar icono del Minimapa/FuBar"
L["Hide Omen"] = "Ocultar Omen"
L["Hide Omen entirely if it collapses to show 0 bars"] = "Oculta Omen completamente si al contraerse muestra cero barras."
L["Hide Omen on 0 bars"] = "Ocultar con cero barras"
L["However, hide Omen if any of the following are true (higher priority than the above)."] = "Sin embargo, oculta Omen si alguno de lo siguiente es verdadero (prioridad sobre lo anterior)."
L["HUNTER"] = "Cazador"
L["Ignore Player Pets"] = "Ignorar mascotas"
L["IGNORE_PLAYER_PETS_DESC"] = [=[Indica a Omen que ignore las mascotas de los jugadores enemigos al determinar qué unidades debe mostrar en los datos de amenaza.

Las mascotas de los jugadores mantienen una tabla de amenaza cuando se encuentran en modo |cffffff78Agresivo|r o |cffffff78Defensivo|r y se comportan de manera normal atacando al objetivo con la amenaza más alta. Si se le indica a la mascota que ataque a un objetivo específico, ésta mantiene su tabla de amenaza, pero permanece con el objetivo asignado el cual por definición tiene 100% de amenaza. Las mascotas de los jugadores pueden ser provocadas para forzarlas a que te ataquen.

Las mascotas de los jugadores en modo |cffffff78Pasivo|r no tienen tabla de amenaza y la habilidad provocar no funciona en ellas, sólo atacarán a su objetivo asignado cuando se les indique hacerlo y lo harán sin ninguna tabla de amenaza.

Cuando a una mascota se le indica |cffffff78Seguir|r al jugador, su tabla de amenaza es eliminada inmediatamente y deja de atacar su objetivo, aunque podría volver a adquirir un nuevo objetivo si se encuentra en modo agresivo/defensivo.]=]
L["Invert Bar/Text Colors"] = "Invertir barras/texto"
L["Left"] = "Izquierda"
L["Lock Omen"] = "Bloquear Omen"
L["Locks Omen in place and prevents it from being dragged or resized."] = "Bloquea Omen en el sitio y evita que sea arrastrado o redimensionado."
L["MAGE"] = "Mago"
L["Makes the Omen window non-interactive"] = "Hace la ventana de Omen no interactiva."
L["Master"] = "Maestro"
L["Max bars to show"] = "Máx. de barras a mostrar"
L["Max number of bars to show"] = "Número máximo de barras que mostrará."
L["Music"] = "Música"
L["'My Bar' BG Color"] = "Color de fondo de \"Mi barra\""
L["Name"] = "Nombre"
L["None"] = "Ninguno"
L["*Not in Party*"] = "*No está en el grupo*"
L["OMEN_DESC"] = "Omen es un medidor ligero de amenaza que muestra la amenaza del enemigo con el que usted está en combate. Puede configurar cómo Omen se ve y funciona, y configurar perfiles diferentes para cada personaje."
L["Omen Quick Menu"] = "Menú rápido de Omen"
L["OMEN_SLASH_DESC"] = "Estos botones ejecutan las mismas funciones que los del comando /omen"
L["OMEN_WARNINGS_DESC"] = "Esta sección te permite configurar cuándo y cómo Omen te notifica si tu amenaza es demasiada alta o si tomas la amenaza."
L["Open Config"] = "Abrir configuración"
L["Open Omen's configuration panel"] = "Abrir el panel de configuración de Omen"
L["Open the configuration dialog"] = "Abrir el panel de configuración"
L["Outline"] = "Borde"
L["PALADIN"] = "Paladín"
L["Passed %s%% of %s's threat!"] = "¡Pasado %s%% de %s de amenaza!"
L["PET"] = "Mascota"
L["Pet Bar Color"] = "Color de la barra de mascotas"
L["Position"] = "Posición"
L["PRIEST"] = "Sacerdote"
L["Print a message to screen when you accumulate too much threat"] = "Muestra un mensaje en pantalla cuándo acumulas demasiada amenaza."
L["Profiles"] = "Perfiles"
L["> Pull Aggro <"] = "> Tomar amenaza <"
L["Pull Aggro Bar Color"] = "Color de la barra de \"Tomar amenaza\""
L["Right"] = "Derecha"
L["Right-click|r to open the options menu"] = "Haz clic con el botón derecho|r para abrir el menú de opciones"
L["ROGUE"] = "Pícaro"
L["Scale"] = "Escala"
L["Sets how far inside the frame the threat bars will display from the 4 borders of the frame"] = "Controla a qué distancia de los cuatro bordes del marco se situarán las barras de amenaza."
L["SFX"] = "SFX"
L["SHAMAN"] = "Chamán"
L["Short Numbers"] = "Números cortos"
L["Show a bar for the amount of threat you will need to reach in order to pull aggro."] = "Muestra una barra que indica la amenaza que necesitas para tomar la amenaza y te ataquen."
L["Show bars for these classes"] = "Mostrar barras para estas clases"
L["Show Classes..."] = "Mostrar clases..."
L["SHOW_CLASSES_DESC"] = "Mostrar barras de amenaza de Omen de las clases siguientes. Las clases de aquí se refieren solamente a las personas que están en tu grupo/banda a excepción de la opción 'No está en el grupo'."
L["Show column headings"] = "Muestra las categorías sobre las columnas."
L["Show Headings"] = "Mostrar categorías"
L["Show icon"] = "Mostrar icono"
L["Show minimap button"] = "Icono en el Minimapa"
L["Show Omen"] = "Mostrar Omen"
L["Show Omen when..."] = "Mostrar Omen cuándo..."
L["Show Omen when any of the following are true"] = "Muestra Omen cuándo cualquiera de lo siguiente es verdadero."
L["Show Omen when you are alone"] = "Muestra Omen cuándo estás solo(a)."
L["Show Omen when you are in a 5-man party"] = "Muestra Omen cuándo estás en un grupo de cinco miembros."
L["Show Omen when you are in a raid"] = "Muestra Omen cuándo estas en una banda."
L["Show Omen when you have a pet out"] = "Muestra Omen cuándo tienes una mascota fuera."
L["Show Pull Aggro Bar"] = "Barra Tomar amenaza"
L["Show text"] = "Mostrar texto"
L["Show the Omen minimap button"] = "Muestra el icono de Omen en el Minimapa."
L["Show the Omen Title Bar"] = "Muestra la barra de título de Omen."
L["Show Threat %"] = "Porcentaje de amenaza"
L["Show threat per second values"] = "Muestra la amenaza por segundo (APS)."
L["Show Threat Values"] = "Valores de amenaza"
L["Show Title Bar"] = "Mostrar barra de título"
L["Show TPS"] = "Mostrar APS"
L["Show When..."] = "Mostrar cuando..."
L["Slash Command"] = "Barras de comando"
L["Smoothly animate bar changes"] = "Anima suavemente las barras."
L["Sound Channel"] = "Canal de sonido"
L["Sound to play"] = "Sonido a reproducir"
L["Spacing between each bar"] = "Espacio entre cada barra."
L["Switch the colors so that the bar background colors and the text colors are swapped."] = "Cambia los colores de modo que el fondo de la barra y el color del texto se intercambien."
L["Tank Bar Color"] = "Color de la barra del tanque"
L["Tells Omen to additionally check your 'focus' and 'focustarget' before your 'target' and 'targettarget' in that order for threat display."] = "Indica a Omen que adicionalmente revise tu 'foco' y 'objetivo de foco' antes que tu 'objetivo' y 'objetivo de objetivo\" en ese orden, en la ventana de amenaza."
L["Tells Omen to enter Test Mode so that you can configure Omen's display much more easily."] = "Omen entra en Modo de prueba para que puedas configurar la ventana de Omen más fácilmente."
L["Temp Threat Bar Color"] = "Color de barra de amenaza temporal"
L["Test Mode"] = "Modo de prueba"
L["Test warnings"] = "Prueba de aviso"
L["Texture to use for the frame's background"] = "Textura usada en el fondo del marco."
L["Texture to use for the frame's border"] = "Textura usada en el borde del marco."
L["The background color for all threat bars"] = "El color de fondo para todas las barras de amenaza."
L["The background color for pets"] = "El color de fondo para las barras de mascotas."
L["The background color for players under the effects of Fade, Mirror Image, glyphed Hand of Salvation, Tricks of the Trade and Misdirection"] = "El color de fondo para los jugadores bajo los efectos de Desvanecerse, Reflejo exacto, Mano de salvación con glifo, Secretos del oficio y Redirección."
L["The background color for your Pull Aggro bar"] = "El color de fondo para tu barra de \"Tomar amenaza\""
L["The background color for your tank's threat bar"] = "El color de fondo de la barra de amenaza del tanque."
L["The background color for your threat bar"] = "El color de fondo de tu barra de amenaza."
L["The color of the labels"] = "El color de las etiquetas."
L["The color of the title text"] = "El color del texto del título."
L["The font that the labels will use"] = "La fuente que las etiquetas usarán."
L["The font that the title text will use"] = "La fuente que el título usará."
L["The outline that the labels will use"] = "El borde que las etiquetas usarán."
L["The outline that the title text will use"] = "El borde que el texto del título usará."
L["The size used to tile the background texture"] = "El tamaño usado para la textura del mosaico del fondo."
L["The texture that the bar will use"] = "La textura que la barra usará."
L["The thickness of the border"] = "El grosor del borde."
L["Thick Outline"] = "Borde grueso"
L["This section controls when Omen is automatically shown or hidden."] = "Esta sección controla cuando Omen se muestra u oculta automáticamente."
L["Threat"] = "Amenaza"
L["Threat [%]"] = "Amenaza [%]"
L["Tile Background"] = "Fondo en mosaico "
L["Tile the background texture"] = "Pone en mosaico la textura de fondo."
L["Title Bar Background Options"] = "Opciones de fondo de la barra de título"
L["Title Bar Height"] = "Altura de la barra de título"
L["Title Bar Settings"] = "Barra de título"
L["Title Text Options"] = "Opciones de texto del título"
L["Toggle Focus"] = "Mostrar/ocultar foco"
L["Toggle Omen"] = "Mostrar/ocultar"
L["TPS"] = "APS"
L["TPS Window"] = "Ventana de APS"
L["TPS_WINDOW_DESC"] = "El cálculo de amenaza por segundo se basa en una ventana deslizante en tiempo real de los últimos X segundos."
L["Turning this on will cause Omen to hide whenever you are in a battleground or arena."] = "Activar esto hace que Omen se oculte mientras estás en un campo de batalla o arena."
L["Turning this on will cause Omen to hide whenever you are in a city or inn."] = "Activar esto hace que Omen se oculte cuando estés en una ciudad o posada."
L["Turning this on will cause Omen to hide whenever you are not in combat."] = "Activar esto hace que Omen se oculte cuando no estés en combate."
L["<Unknown>"] = "<Desconocido>"
L["Use a different colored background for the tank's threat bar in Omen"] = "Usa un color de fondo diferente para la barra de amenaza del tanque en Omen."
L["Use a different colored background for your threat bar in Omen"] = "Usa un color de fondo diferente para tu barra de amenaza en Omen."
L["Use Auto Show/Hide"] = "Automostrar/ocultar"
L["Use !ClassColors"] = "Usar !ClassColors"
L["Use Class Colors"] = "Usar colores de clase"
L["Use !ClassColors addon for class colors for the background color of threat bars"] = "Usa el Addon !ClassColors para los colores de fondo de las barras de amenaza."
L["Use Focus Target"] = "Usar objetivo de foco"
L["Use 'My Bar' color"] = "Color de tu barra"
L["Use Same Background"] = "Usar el mismo fondo"
L["Use standard class colors for the background color of threat bars"] = "Usa los colores de clase estándar para el color de fondo de las barras de amenaza."
L["Use Tank Bar color"] = "Color del tanque"
L["Use the same background settings for the title bar as the main window's background"] = "Usa las mismas opciones de fondo de la ventana principal en la barra de título."
L["WARLOCK"] = "Brujo"
L["Warning Settings"] = "Opciones de aviso"
L["Warning Threshold %"] = "Umbral de aviso %"
L["Warrior"] = "Guerrero"
L["WARRIOR"] = "Guerrero"
L["WARRIOR_FAQ"] = [=[La siguiente información está obtenida de |cffffd200http://www.tankspot.com/forums/f200/39775-wow-3-0-threat-values.html|r 02 de octubre 2008 (crédito a Satrina). Los números son para un personaje de nivel 80.

|cffffd200Modificadores|r
Actitud de batalla ________ x 80
Actitud rabiosa _____ x 80
Maestría táctica _____ x 121/142/163
Actitud defensiva _____ x 207.35

Nota que en nuestras estimaciones originales (que usamos ahora en WoW 2.0), comparábamos 1 daño a 1 amenaza, y usábamos 1.495 para representar el modificador multiplicador de actitud + desafío. Ahora vemos que el método de Blizzard es para usar el multiplicador sin decimales, así en 2.x habría estado x149 (quizás x149.5); es x207 (quizás 207.3) en 3.0. Supongo que esto es para permitir el transporte de números enteros en vez de decimales a través del Internet para mejorar el rendimiento. Parece que los valores de amenaza son multiplicados por 207.35 al servidor, pues redondeado.

Si quiere usar el método 1 daño = 1 amenaza todavía; los modificadores de actitud son 0.8 y 2.0735, etc...

|cffffd200Valores de Amenaza (modificadores de actitud aplica a menos que dijera otra cosa):|r
Grito de batalla _________ 78 (divido)
Rajar _______________ daño + 225 (divido)
Grito de orden _____ 80 (divido)
Arremetida de conmoción ______ daño solamente
Escudo de daño ________ daño solamente
Grito desmoralizador ___ 63 (divido)
Devastar ____________ daño + 5% de AP
Esquivar/Parar/Bloquear_____ 1 (en actitud defensiva solamente con Actitud defensiva mejorada)
Golpe heroico ________ daño + 259
Salto heroico _________ 1.50 x daño
Gana de ira ____________ 5 (sin modificador de actitud)
Desgarrar _________________ daño solamente
Revancha ______________ daño + 121
Azote de escudo __________ 36
Embate con escudo __________ daño + 770
Onda de choque ____________ daño solamente
Embate _________________ daño + 140
Reflejo de hechizos ________ daño solamente
Amenaza social _________ 0
Hender armadura ________ 345 + 5%AP
Atronar _________ 1.85 x daño
Vigilancia ____________ 10% de la amenaza del blanco (sin modificador de actitud)

No gana amenaza por reflejar hechizos apuntado a sus aliados con Reflejo de hechizos mejorado. Cuándo refleja un hechizo por un aliado, el aliado gana la amenaza por el daño del hechizo.
]=]
L["You are alone"] = "Estás solo(a)"
L["You are in a battleground"] = "Estás en un campo de batalla"
L["You are in a party"] = "Estás en un grupo"
L["You are in a raid"] = "Estás en una banda"
L["You are not in combat"] = "No estás en combate"
L["You are resting"] = "Estás en una ciudad o posada"
L["You have a pet"] = "Tienes una mascota"

