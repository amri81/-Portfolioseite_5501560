Dokumentation zur Navigation und Seitenerstellung der Portfolio-App

Navigation

Die Navigation in der Portfolio-App wurde mithilfe des MaterialApp-Routers und eines TabController implementiert. Der MaterialApp-Router stellt die Hauptstruktur der App bereit und ermöglicht das Routing zwischen verschiedenen Seiten. Der TabController wird verwendet, um die verschiedenen Tabs in der Navigationsleiste zu steuern, die am oberen Rand der App angezeigt wird.

Seitenbeschreibung
Startseite:
Die Startseite dient als Begrüßungsseite für Besucher. Sie enthält eine kurze Willkommensnachricht und eine Einführung zur Portfolio-Seite.

Über mich:
Auf dieser Seite gibt es eine Beschreibung der Person, einschließlich ihrer Interessen und Motivation. Es werden auch Links zur Kontaktaufnahme per E-Mail und LinkedIn angeboten.

Lebenslauf:
Diese Seite bietet einen Link, um den Lebenslauf als PDF anzuzeigen. Dies ermöglicht es den Besuchern, die beruflichen Qualifikationen und Erfahrungen der Person einzusehen.

Fähigkeiten:
Diese Seite listet verschiedene Fähigkeiten der Person auf, begleitet von Bildern, die diese Fähigkeiten visuell darstellen. Hier werden sowohl technische als auch nicht-technische Fähigkeiten gezeigt.

Kontakt:
Diese Seite enthält ein Formular, das es Benutzern ermöglicht, eine Nachricht zu senden. Das Formular prüft die Eingaben und öffnet die E-Mail-App mit den eingegebenen Informationen.

Implementierung und Widgets
MaterialApp-Router: Verantwortlich für das Haupt-Routing und das Thema der App. Unterstützt sowohl helle als auch dunkle Themen, die über die App-Leiste gewechselt werden können.
TabController und TabBar: Ermöglichen die Navigation zwischen den verschiedenen Bereichen der App. Die TabBar befindet sich in der App-Leiste und bietet einfache Navigation durch die Tabs.
Seiten-Widgets: Jede Seite ist als eigenes Widget implementiert. Diese Widgets enthalten die spezifischen Inhalte und Layouts für die jeweiligen Seiten.
Benutzerfreundlichkeit und Gestaltung
Die App verwendet Material Design Komponenten, um eine ansprechende und konsistente Benutzeroberfläche zu gewährleisten. Es wurde darauf geachtet, dass die App sowohl auf Desktop- als auch auf mobilen Geräten gut aussieht und funktioniert.

Die Portfolio-App ist modular aufgebaut, was bedeutet, dass jeder Bereich der App in einem separaten Widget organisiert ist. Dies fördert die Sauberkeit des Codes und erleichtert zukünftige Erweiterungen und Wartungen.
 
 
