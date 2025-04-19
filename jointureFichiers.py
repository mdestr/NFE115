class JointureFichiers(MRJob):
    """
    Réaliser un programme Map/Reduce qui réalise la jointure entre les données qui se trouvent dans les fichiers u.data et u.item.
    La jointure sera réalisée sur l’identifiant du film.
    Pour chaque film, on veut afficher son nom, son identifiant, son année et la liste de toutes ses notes ordonnées par ordre croissant.

    Si probleme d'encodage utf-8 lors de l'execution du mapper sur u.item, changer l'encodage de celui-ci a utf-8
    Par ex avec emacs : emacs --batch u.item -eval '(progn (set-buffer-file-coding-system '\''utf-8) (save-buffer))'
    """
    def steps(self):
        return [
            MRStep(mapper=self.mapper_get_id_film,
                   reducer=self.reducer_join_fichiers)
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
                liste_notes.append(crt[0])

        liste_triee=sorted(liste_notes)
        notes_affichees = "[";
        for note in liste_triee:
            notes_affichees += note+" "
        notes_affichees+= "]"
        yield "#"+nom_f +"|"+ID_f+"|"+date_f+"#",  notes_affichees

if __name__ == '__main__':
    JointureFichiers.run()