from mrjob.job import MRJob
from mrjob.step import MRStep

class CalculNotes(MRJob):
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
        yield None, (str(sum(values)).zfill(5), key)

    def reducer_trier_resultat(self, _, pairs):
        pairs=sorted(pairs)
        for nb, ID_f in pairs:
            yield ID_f, int(nb)

if __name__ == '__main__':
    CalculNotes.run()