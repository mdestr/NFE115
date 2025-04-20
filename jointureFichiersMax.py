from mrjob.job import MRJob
from mrjob.step import MRStep
from operator import itemgetter

class JointureFichiersMax(MRJob):
    """
    Réaliser un programme Map/Reduce qui affiche le(s) film(s) avec la meilleure note moyenne.
    Pour chaque film, afficher son nom, sont identifiant et son année de sortie.
    """
    def steps(self):
        return [
            MRStep(mapper=self.mapper_get_id_film,
                   reducer=self.reducer_join_fichiers),
            MRStep(reducer=self.reducer_calcul_max)
        ]

    def mapper_get_id_film(self, _, ligne):
        ligne      = ligne.strip()      #enlever carriage return
        liste      = ligne.split('\t')

        if len(liste)== 4: #u.data
            ID_f = liste[1]
            note = liste[2]

            yield ID_f, note
        else: #u.item
            liste = ligne.split('|')
            ID_f = liste[0]
            nom_f=liste[1]
            date_f=liste[2]

            yield ID_f, nom_f+"|"+date_f

    def reducer_join_fichiers(self, ID_f, valeurs):
        nom_f = None
        date_f= None
        liste_notes    = []

        for val in valeurs:
            crt = val.split('|');
            if len(crt) == 2: #nom_f date_f
                nom_f = crt[0]
                date_f = crt[1]

            else:#note
                liste_notes.append(float(crt[0]))

        film= "#"+nom_f +"|"+ID_f+"|"+date_f+"#"
        avg =  sum(liste_notes)/len(liste_notes)
        yield None, (film, avg)

    def reducer_calcul_max(self, _, valeurs):
        t_max = max(valeurs,key=itemgetter(1))
        yield t_max[0], t_max[1]

if __name__ == '__main__':
    JointureFichiersMax.run()
