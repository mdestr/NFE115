/*
Ecrire l’ensemble d’instructions qui permettent d’obtenir les films qui ont été le moins notés
(qui ont eu le plus petit nombre de notes attribuées).
Pour chaque film on veut connaître son titre et son nombre de notes.
Le résultat final doit contenir au maximum 3 tuples et doit être ordonné par ordre décroissant en
fonction du nom du film (aide: utiliser count au lieu de avg pour compter les notes).
*/

-- Load data
ratings = LOAD '/user/maria_dev/movielens/u.data' AS (userID:int, movieID:int, rating:int, ratingTime:int);

-- Compter le nombre de notes pour chaque film
ratingsByMovie = GROUP ratings BY movieID;
nbNotesParFilm = FOREACH ratingsByMovie GENERATE group AS movieID, COUNT(ratings) AS numRatings;

-- Trier les films par nombre de notes en ordre croissant
nbNotesTrie = ORDER nbNotesParFilm BY numRatings ASC;

-- Limiter à 3 films avec le moins de notes
nbNotesLimitees = LIMIT nbNotesTrie 3;

-- Charger les métadonnées des films
metadata = LOAD '/user/maria_dev/movielens/u.item'
	USING PigStorage('|')
    AS (movieID:int, movieTitle:chararray, releaseDate:chararray, videoRelease:chararray, imdbLink: chararray);

-- Joindre les métadonnées avec le nombre de notes pour chaque film
filmsAvecNbNotes = JOIN nbNotesLimitees BY movieID, metadata BY movieID;

-- Trier les résultats par ordre décroissant en fonction du nom du film
resultatFinal = ORDER filmsAvecNbNotes BY movieTitle DESC;

-- Afficher les résultats
DUMP resultatFinal;