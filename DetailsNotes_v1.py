from mrjob.job import MRJob
from mrjob.step import MRStep

class CalculNotes(MRJob):
    def steps(self):
        return [
            MRStep(mapper=self.mapper_notes,
                   reducer=self.reducer_somme_notes)
        ]

    def mapper_notes(self, _, line):
        (ID_u, ID_f, note, timestamp) = line.split('\t')
        yield note, 1

    def reducer_somme_notes(self, key, values):
        yield key, sum(values)

if __name__ == '__main__':
    CalculNotes.run()
