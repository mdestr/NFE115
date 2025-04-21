notes = LOAD '/user/maria_dev/ml-100k/u.data' AS (ID_u:int, ID_f:int, note:int, tempsNote:int);
description = LOAD '/user/maria_dev/ml-100k/u.item' USING PigStorage('|') AS (ID_f:int,titre:chararray, dateSortie:chararray, sortieVideo:chararray, lienImdb: chararray);

-- Chargement de données
notes = LOAD '/user/maria_dev/movielens/u.data' AS (ID_u:int, ID_f:int, note:int, tempsNote:int);
description = LOAD '/user/maria_dev/movielens/u.item'
	USING PigStorage('|')
    AS (ID_f:int,titre:chararray, dateSortie:chararray, sortieVideo:chararray, lienImdb: chararray);

-- Générer une relation à partir d’une autre
rechercheTitre = FOREACH description GENERATE ID_f, titre, ToDate(dateSortie, 'dd-MMM-yyyy') AS dateSortie;

-- Regroupement
notesParFilm = GROUP notes by ID_f;
filmsParDate = GROUP rechercheTitre by dateSortie;

-- Restructuration
notesMoyennes = FOREACH notesParFilm GENERATE group as ID_f, AVG(notes.note) AS noteMoy;
datesFilms = FOREACH filmsParDate GENERATE group, rechercheTitre.titre;

-- Filtrage
meilleursFilms = FILTER notesMoyennes BY noteMoyenne > 4;

-- Jointure
titresMeilleursFilms = JOIN meilleursFilms BY ID_f, rechercheTitre BY ID_f;

-- Tri
meilleursFilmsAnciens= ORDER titresMeilleursFilms by rechercheTitre::dateSortie;

-- Limit
meilleursFilmsAnciens= LIMIT meilleursFilmsAnciens 5;

-- Dégroupage
flattened= FOREACH datesFilms GENERATE group, flatten($1);

-- Co-group
titresFilmsG = COGROUP meilleursFilms BY ID_f, description BY ID_f;
DUMP titresFilmsG;

