# Operator Przejścia

## Nazwa zespołu
Nocne Koszmary
## Skład zespołu
- **Anna Panasyuk** – gate_controller.gd, polaryzacja, cooldown, kolizja/bramka, reguły A/B/N.
- **Kamila Trątnowiecka** – VFX/UI/Audio.
- **Kamila Piotrowska** – enemy.gd, enemy_spawner.gd, wave_manager.gd, HP bazy, game over/win, punktacja.

## Tytuł gry
Operator Przejścia

## Gatunek
2D arcade / reaction game

## Silnik gry / Technologie
- Godot Engine 4.6.1
- GDScript
- Sceny `.tscn`
- AudioStreamPlayer2D, GPUParticles2D, UI (CanvasLayer)

## Krótki opis gry
Gracz steruje bramą pomiędzy dwoma stronami rzeczywistości i musi szybko zmieniać jej polaryzację. Wrogowie nadchodzą falami i mają różne typy (A, B, N). Poprawne dopasowanie polaryzacji daje punkty, błędne dopasowanie powoduje karę punktową. Celem jest utrzymanie kontroli jak najdłużej i uzyskanie jak najwyższego wyniku.

## W jaki sposób gra nawiązuje do tematu „Druga Strona”?
Motyw „Druga Strona” jest realizowany przez mechanikę dwóch polaryzacji bramy (A/B), które reprezentują dwa odmienne stany świata. Gracz stale przełącza się między nimi, reagując na przeciwników z „drugiej strony”. Rozgrywka opiera się na napięciu między tymi dwoma stanami i konsekwencjach wyboru niewłaściwej strony.

## Polaryzacja (prosto)
- **Białe kwadraciki**: brama powinna być **czerwona**.
- **Czarne kwadraciki**: brama powinna być **niebieska**.
- Jeśli kolor bramy jest źle ustawiony, tracisz punkty.

## Sposób punktowania
- **+12 punktów** za poprawny blok (dobrze dobrana polaryzacja).
- **-10 punktów** za złą polaryzację.
- **-8 punktów** za przeciwnika neutralnego (`N`), który przechodzi.

## Sterowanie
- **Spacja** – zmiana polaryzacji bramy (A/B)
- **R** – restart rozgrywki

## Wykorzystane zasoby
- Grafiki i dźwięki użyte w projekcie: **autorskie / przygotowane przez zespół na potrzeby hackathonu**.
