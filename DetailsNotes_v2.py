from mrjob.job import MRJob
from mrjob.step import MRStep

class CalculNotes(MRJob):
    """
    Calculer pour chaque identifiant de film le nombre de notes obtenues.

    Utiliser le tri automatique de chaque Reducer.
    Ajouter une etape Map/Reduce supplementaire contenant seulement le code des Reducers utilises pour le tri (pas de Mapper).
    Les cles obtenues par les reducers doivent etre les nombre des notes obtenues par les films.

    Les notes seront considerees comme etant des chaines de caracteres et le tri sera fait par ordre alphabetique (2 sera apres 10).
    => Pour trier correctement ces nombres on utilise la fonction zfill(5) qui va ajouter des valeurs de gauche a
    droite pour un total de 5 chiffres.
    """
    def steps(self):
        return [
            MRStep(mapper=self.mapper_films,
                   reducer=self.reducer_nb_films),
            MRStep(reducer=self.reducer_trier_resultat)
        ]

    def mapper_films(self, _, line):
        (ID_u, ID_f, note, timestamp) = line.split('\t')
        yield ID_f, 1

    def reducer_nb_films(self, key, values):
        yield str(sum(values)).zfill(5), key

    def reducer_trier_resultat(self, nb, films):
        for film in films:
            yield film, int(nb)

if __name__ == '__main__':
    CalculNotes.run()
