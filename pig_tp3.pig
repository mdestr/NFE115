/*
Ecrire l’ensemble d’instructions qui permettent d’obtenir les films qui ont été le moins notés
(qui ont eu le plus petit nombre de notes attribuées).
Pour chaque film on veut connaître son titre et son nombre de notes.
Le résultat final doit contenir au maximum 3 tuples et doit être ordonné par ordre décroissant en
fonction du nom du film (aide: utiliser count au lieu de avg pour compter les notes).
*/

-- Load data
notes = LOAD '/user/maria_dev/ml-100k/u.data' AS (ID_u:int, ID_f:int, note:int, tempsNote:int);
description = LOAD '/user/maria_dev/ml-100k/u.item'
	USING PigStorage('|')
    AS (ID_f:int,titre:chararray, dateSortie:chararray, sortieVideo:chararray, lienImdb: chararray);


-- Regroupement
notesParFilm = GROUP notes by ID_f;

-- Restructuration
notesNb = FOREACH notesParFilm GENERATE group as ID_f, COUNT(notes.note) AS nbNotes;

-- Limit
leastEvaluatedMovies = LIMIT notesNb 3;