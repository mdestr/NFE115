CREATE (cleopatre {personnageid: 56, name: 'Cleopatre', nationalite: 'Egyptienne', personnagetype: 'Les autres'}),
       (cesarionPtolemeeXVI {personnageid: 44, name: 'Cesarion (Ptolemee XVI)', nationalite: 'Romain/Egyptien',personnagetype: 'Les autres'}),
       (julesCesar {personnageid: 91, name: 'Jules Cesar', nationalite: 'Romain', personnagetype: 'Les Romains'}),
       (numerobis {personnageid: 116, name: 'Numerobis', nationalite: 'Egyptien', personnagetype: 'Les autres'}),
       (caiusObtus {personnageid: 34, name: 'Caius Obtus', nationalite: 'Romain', personnagetype: 'Les Romains'}),
       (caligulaAlavacomgetepus {personnageid: 38, name: 'Caligula Alavacomgetepus', nationalite: 'Romain',personnagetype: 'Les Romains'}),
       (brutus {personnageid: 28, name: 'Brutus', nationalite: 'Romain', personnagetype: 'Les Romains'}),
       (assurancetourix {personnageid: 12, name: 'Assurancetourix', nationalite: 'Gaulois', personnagetype: 'Les Gaulois'}),
       (briseradius {personnageid: 27, name: 'Briseradius', nationalite: 'Romain', personnagetype: 'Les Romains'}),
       (epidemais {personnageid: 65, name: 'Epidemais', nationalite: 'Phenicien', personnagetype: 'Les autres'}),
       (lupus {personnageid: 104, name: 'Lupus', nationalite: 'Romain', personnagetype: 'Les Romains'}),
       (album1 {albumid: 1, name:'Asterix le Gaulois', premiereedition: '1961'}),
       (album4 {albumid: 4, name:'Asterix Gladiateur', premiereedition: '1964'}),
       (album6 {albumid: 6, name:'Asterix et Cleopatre', premiereedition: '1965'}),
       (album8 {albumid: 8, name:'Asterix chez les Bretons', premiereedition: '1966'}),
       (album10 {albumid: 10, name:'Asterix legionnaire', premiereedition: '1967'}),
       (album11 {albumid: 11, name:'Le Bouclier arverne', premiereedition: '1968'}),
       (album14 {albumid: 14, name:'Asterix en Hispanie', premiereedition: '1969'}),
       (album15 {albumid: 15, name:'La Zizanie', premiereedition: '1970'}),
       (album17 {albumid: 17, name:'Le Domaine des dieux', premiereedition: '1971'}),
       (album18 {albumid: 18, name:'Les Lauriers de Cesar', premiereedition: '1972'}),
       (album19 {albumid: 19, name:'Le Devin', premiereedition: '1972'}),
       (album21 {albumid: 21, name:'Le Cadeau de Cesar', premiereedition: '1974'}),
       (album23 {albumid: 23, name:'Obelix et Compagnie', premiereedition: '1976'}),
       (album24 {albumid: 24, name:'Asterix chez les Belges', premiereedition: '1979'}),
       (album26 {albumid: 26, name:"L'Odyssee d'Asterix", premiereedition: '1981'}),
       (album27 {albumid: 27, name:"Le Fils d'Asterix", premiereedition: '1983'}),
       (album28 {albumid: 28, name:'Asterix chez Rahazade', premiereedition: '1987'}),
       (album29 {albumid: 29, name:'La Rose et le glaive', premiereedition: '1991'}),
       (album30 {albumid: 30, name:"La Galere d'Obelix", premiereedition: '1996'}),
       (album31 {albumid: 31, name:'Asterix et Latraviata', premiereedition: '2001'}),
       (album32 {albumid: 32, name:'Asterix et la rentree gauloise', premiereedition: '2003'}),
       (album34 {albumid: 34, name:"L'Anniversaire d'Asterix et Obelix - Le Livre d'or", premiereedition: '2009'}),
       (lesGaulois {personnagetypeid: 1, name: 'Les Gaulois'}),
       (lesRomains {personnagetypeid: 2, name: 'Les Romains'}),
       (lesAutres {personnagetypeid: 3, name: 'Les autres'}),
       (egyptien {nationaliteid: 9, name: 'Egyptien'}),
       (egyptienne {nationaliteid: 10, name: 'Egyptienne'}),
       (gaulois {nationaliteid: 13, name: 'Gaulois'}),
       (phenicien {nationaliteid: 21, name: 'Phenicien'}),
       (romain {nationaliteid: 23, name: 'Romain'}),
       (romainEgyptien {nationaliteid: 24, name: 'Romain/Egyptien'}),
       (cleopatre)-[:COMPAGNON_AVENTURE]->(cesarionPtolemeeXVI),
       (cleopatre)-[:COMPAGNON_AVENTURE]->(julesCesar),
       (cleopatre)-[:COMPAGNON_AVENTURE]->(numerobis),
       (julesCesar)-[:COMPAGNON_AVENTURE]->(cesarionPtolemeeXVI),
       (julesCesar)-[:COMPAGNON_AVENTURE]->(cleopatre),
       (julesCesar)-[:COMPAGNON_AVENTURE]->(caiusObtus),
       (julesCesar)-[:COMPAGNON_AVENTURE]->(caligulaAlavacomgetepus),
       (julesCesar)-[:COMPAGNON_AVENTURE]->(brutus),
       (caiusObtus)-[:COMPAGNON_AVENTURE]->(assurancetourix),
       (caiusObtus)-[:COMPAGNON_AVENTURE]->(briseradius),
       (caiusObtus)-[:COMPAGNON_AVENTURE]->(epidemais),
       (caiusObtus)-[:COMPAGNON_AVENTURE]->(julesCesar),
       (caiusObtus)-[:COMPAGNON_AVENTURE]->(lupus),
       (caligulaAlavacomgetepus)-[:COMPAGNON_AVENTURE]->(assurancetourix),
       (caligulaAlavacomgetepus)-[:COMPAGNON_AVENTURE]->(julesCesar),
       (cleopatre)-[:APPARAIT_DANS]->(album6),
       (cleopatre)-[:APPARAIT_DANS]->(album27),
       (cleopatre)-[:APPARAIT_DANS]->(album30),
       (cleopatre)-[:APPARAIT_DANS]->(album34),
       (julesCesar)-[:APPARAIT_DANS]->(album1),
       (julesCesar)-[:APPARAIT_DANS]->(album4),
       (julesCesar)-[:APPARAIT_DANS]->(album6),
       (julesCesar)-[:APPARAIT_DANS]->(album8),
       (julesCesar)-[:APPARAIT_DANS]->(album10),
       (julesCesar)-[:APPARAIT_DANS]->(album11),
       (julesCesar)-[:APPARAIT_DANS]->(album14),
       (julesCesar)-[:APPARAIT_DANS]->(album15),
       (julesCesar)-[:APPARAIT_DANS]->(album17),
       (julesCesar)-[:APPARAIT_DANS]->(album18),
       (julesCesar)-[:APPARAIT_DANS]->(album19),
       (julesCesar)-[:APPARAIT_DANS]->(album21),
       (julesCesar)-[:APPARAIT_DANS]->(album23),
       (julesCesar)-[:APPARAIT_DANS]->(album24),
       (julesCesar)-[:APPARAIT_DANS]->(album26),
       (julesCesar)-[:APPARAIT_DANS]->(album28),
       (julesCesar)-[:APPARAIT_DANS]->(album29),
       (julesCesar)-[:APPARAIT_DANS]->(album30),
       (julesCesar)-[:APPARAIT_DANS]->(album31),
       (julesCesar)-[:APPARAIT_DANS]->(album32),
       (julesCesar)-[:APPARAIT_DANS]->(album34),
       (numerobis)-[:APPARAIT_DANS]->(album6),
       (numerobis)-[:APPARAIT_DANS]->(album34),
       (cesarionPtolemeeXVI)-[:APPARAIT_DANS]->(album27),
       (caiusObtus)-[:APPARAIT_DANS]->(album4),
       (caligulaAlavacomgetepus)-[:APPARAIT_DANS]->(album4),
       (assurancetourix)-[:PERSONNAGE_TYPE]->(lesGaulois),
       (briseradius)-[:PERSONNAGE_TYPE]->(lesRomains),
       (brutus)-[:PERSONNAGE_TYPE]->(lesRomains),
       (caiusObtus)-[:PERSONNAGE_TYPE]->(lesRomains),
       (caligulaAlavacomgetepus)-[:PERSONNAGE_TYPE]->(lesRomains),
       (cesarionPtolemeeXVI)-[:PERSONNAGE_TYPE]->(lesAutres),
       (cleopatre)-[:PERSONNAGE_TYPE]->(lesAutres),
       (epidemais)-[:PERSONNAGE_TYPE]->(lesAutres),
       (julesCesar)-[:PERSONNAGE_TYPE]->(lesRomains),
       (lupus)-[:PERSONNAGE_TYPE]->(lesRomains),
       (numerobis)-[:PERSONNAGE_TYPE]->(lesAutres),
       (assurancetourix)-[:NATIONALITE]->(gaulois),
       (briseradius)-[:NATIONALITE]->(romain),
       (brutus)-[:NATIONALITE]->(romain),
       (caiusObtus)-[:NATIONALITE]->(romain),
       (caligulaAlavacomgetepus)-[:NATIONALITE]->(romain),
       (cesarionPtolemeeXVI)-[:NATIONALITE]->(romainEgyptien),
       (cleopatre)-[:NATIONALITE]->(egyptienne),
       (epidemais)-[:NATIONALITE]->(phenicien),
       (julesCesar)-[:NATIONALITE]->(romain),
       (lupus)-[:NATIONALITE]->(romain),
       (numerobis)-[:NATIONALITE]->(egyptien)

// afficher tous les noeuds et tous les arcs
MATCH (n)-[r]->(m)
RETURN n, r, m
//╒═════════════════════════╤═════════════════════╤═════════════════════════╕
//│n                        │r                    │m                        │
//╞═════════════════════════╪═════════════════════╪═════════════════════════╡
//│({personnageid: 56,nation│[:COMPAGNON_AVENTURE]│({personnageid: 44,nation│
//│alite: "Egyptienne",name:│                     │alite: "Romain/Egyptien",│
//│ "Cleopatre",personnagety│                     │name: "Cesarion (Ptolemee│
//│pe: "Les autres"})       │                     │ XVI)",personnagetype: "L│
//│                         │                     │es autres"})             │
//├─────────────────────────┼─────────────────────┼─────────────────────────┤
//│({personnageid: 56,nation│[:COMPAGNON_AVENTURE]│({personnageid: 91,nation│
//│alite: "Egyptienne",name:│                     │alite: "Romain",name: "Ju│
//│ "Cleopatre",personnagety│                     │les Cesar",personnagetype│
//│pe: "Les autres"})       │                     │: "Les Romains"})        │
//├─────────────────────────┼─────────────────────┼─────────────────────────┤...

// Ajouter une étiquette :PERSONNAGE aux noeuds qui ont une propriété “personnageid”
MATCH (n)
  WHERE n.personnagetype IS NOT NULL
SET n:PERSONNAGE RETURN n.name
//╒══════════════════════════╕
//│n.name                    │
//╞══════════════════════════╡
//│"Cleopatre"               │
//├──────────────────────────┤
//│"Cesarion (Ptolemee XVI)" │
//├──────────────────────────┤
//│"Jules Cesar"             │
//├──────────────────────────┤...

// Compter le nombre de nœuds
MATCH(n) RETURN count(n)
//╒════════╕
//│COUNT(n)│
//╞════════╡
//│42      │
//└────────┘

// Compter le nombre d'arcs
MATCH () – [] -> () RETURN COUNT(*)
//╒════════╕
//│COUNT(*)│
//╞════════╡
//│67      │
//└────────┘

// Trouver l'étiquette du noeud dont le nom est 'Jules Cesar'
MATCH (n {name:'Jules Cesar'})
RETURN labels(n) AS labels
//╒══════════════╕
//│labels        │
//╞══════════════╡
//│["PERSONNAGE"]│
//└──────────────┘

// Trouver l'étiquette des arcs vers le noeud dont le nom est 'Le Domaine des dieux'
MATCH (n {name: 'Le Domaine des dieux'}) <- [r] -()
RETURN DISTINCT type(r)
//╒═══════════════╕
//│TYPE(r)        │
//╞═══════════════╡
//│"APPARAIT_DANS"│
//└───────────────┘

// Afficher toutes les propriétés de deux noeuds parmi les noeuds de type PERSONNAGE.
MATCH (n:PERSONNAGE)
RETURN n LIMIT 2
//╒═════════════════════════════════════╕
//│n                                    │
//╞═════════════════════════════════════╡
//│(:PERSONNAGE {personnageid: 56,nation│
//│alite: "Egyptienne",name: "Cleopatre"│
//│,personnagetype: "Les autres"})      │
//├─────────────────────────────────────┤
//│(:PERSONNAGE {personnageid: 44,nation│
//│alite: "Romain/Egyptien",name: "Cesar│
//│ion (Ptolemee XVI)",personnagetype: "│
//│Les autres"})                        │
//├─────────────────────────────────────┤

//  Afficher les noms des personnages qui n'ont pas d'arc sortant de type COMPAGNON_AVENTURE.
MATCH (n:PERSONNAGE)
  WHERE NOT (n) -[:COMPAGNON_AVENTURE] -> ()
RETURN DISTINCT n.name
//╒═════════════════════════╕
//│n.name                   │
//╞═════════════════════════╡
//│"Cesarion (Ptolemee XVI)"│
//├─────────────────────────┤
//│"Numerobis"              │...

// Afficher les noms des noeuds qui forment un cycle en triangle (on considère le graphe comme étant non-dirigé)
MATCH (a)--(b)--(c)--(a)
RETURN DISTINCT a.name, b.name, c.name
LIMIT 2

// Afficher les noms des couples de personnages qui apparaissent dans le même album ainsi que l'id de album commun.
MATCH (p1:PERSONNAGE)-[:APPARAIT_DANS]-(m)-[:APPARAIT_DANS]-(p2:PERSONNAGE)
RETURN p1.name, p2.name, m.albumid
// Autre solution :
MATCH (p1)-[:APPARAIT_DANS]->(m), (p2)-[:APPARAIT_DANS]->(m)
  WHERE p1 <> p2
RETURN DISTINCT p1.name, p2.name, m.albumid

//╒══════════════════════════╤══════════════════════════╤═════════╕
//│p1.name                   │p2.name                   │m.albumid│
//╞══════════════════════════╪══════════════════════════╪═════════╡
//│"Jules Cesar"             │"Cleopatre"               │6        │
//├──────────────────────────┼──────────────────────────┼─────────┤
//│"Numerobis"               │"Cleopatre"               │6        │
//├──────────────────────────┼──────────────────────────┼─────────┤
//│"Cesarion (Ptolemee XVI)" │"Cleopatre"               │27       │
//├──────────────────────────┼──────────────────────────┼─────────┤

// Afficher le sous-graphe des personnages reliés par des arcs de type COMPAGNON_AVENTURE qui ne contient pas 'Cleopatre'.
MATCH (n)-[r:COMPAGNON_AVENTURE]->(m)
  WHERE n.name <> 'Cleopatre' AND m.name <> 'Cleopatre'
RETURN n, m
// ╒═════════════════════════════════════╕
// │n                                    │
// ╞═════════════════════════════════════╡
// │(:PERSONNAGE {personnageid: 44,nation│
// │alite: "Romain/Egyptien",name: "Cesar│
// │ion (Ptolemee XVI)",personnagetype: "│
// │Les autres"})                        │
// ├─────────────────────────────────────┤
// │(:PERSONNAGE {personnageid: 44,nation│
// │alite: "Romain/Egyptien",name: "Cesar│
// │ion (Ptolemee XVI)",personnagetype: "│
// │Les autres"})                        │
// ├─────────────────────────────────────┤


// Afficher le sous-graphe contenant comme noeuds source 'Cleopatre', 'Jules Cesar' ou
// 'Caius Obtus' et comme noeuds destination 'Cesarion (Ptolemee XVI)' ou 'Caligula
// Alavacomgetepus'. Les noeuds sont reliés par des arcs de type COMPAGNON_AVENTURE
MATCH (n) -[:COMPAGNON_AVENTURE] - (m)
WHERE n.name IN ['Cleopatre', 'Jules Cesar', 'Caius Obtus']
AND m.name IN ['Cesarion (Ptolemee XVI)', 'Caligula Alavacomgetepus']
RETURN n.personnageid, n.name, m.personnageid, m.name
//╒══════════════╤═════════════╤══════════════╤═══════════════════╕
//│n.personnageid│n.name       │m.personnageid│m.name             │
//╞══════════════╪═════════════╪══════════════╪═══════════════════╡
//│56            │"Cleopatre"  │44            │"Cesarion (Ptolemee│
//│              │             │              │ XVI)"             │
//├──────────────┼─────────────┼──────────────┼───────────────────┤
//│91            │"Jules Cesar"│44            │"Cesarion (Ptolemee│
//│              │             │              │ XVI)"             │
//├──────────────┼─────────────┼──────────────┼───────────────────┤
//│91            │"Jules Cesar"│38            │"Caligula Alavacomg│
//│              │             │              │etepus"            │
//└──────────────┴─────────────┴──────────────┴───────────────────┘

// Afficher le sous-graphe contenant les noeuds qui se trouvent à une distance 3 de
// 'Cleopatre' ainsi que les arcs de type COMPAGNON_AVENTURE qui les relient. On considère
// uniquement les arcs dirigés de type COMPAGNON_AVENTURE.
MATCH p=(a)-[:COMPAGNON_AVENTURE*3..3]->(b)
  WHERE a.name='Cleopatre'
RETURN p
//╒═════════════════════════════════════════════════════╕
//│p                                                    │
//╞═════════════════════════════════════════════════════╡
//│(:PERSONNAGE {personnageid: 56,nationalite: "Egyptien│
//│ne",name: "Cleopatre",personnagetype: "Les autres"})-│
//│[:COMPAGNON_AVENTURE]->(:PERSONNAGE {personnageid: 91│
//│,nationalite: "Romain",name: "Jules Cesar",personnage│
//│type: "Les Romains"})-[:COMPAGNON_AVENTURE]->(:PERSON│
//│NAGE {personnageid: 56,nationalite: "Egyptienne",name│
//│: "Cleopatre",personnagetype: "Les autres"})-[:COMPAG│
//│NON_AVENTURE]->(:PERSONNAGE {personnageid: 44,nationa│
//│lite: "Romain/Egyptien",name: "Cesarion (Ptolemee XVI│
//│)",personnagetype: "Les autres"})                    │
//├─────────────────────────────────────────────────────┤


// Afficher le plus court chemin et sa longueur entre Jules Cesar et Epidemais
MATCH p=shortestPath((n)-[:COMPAGNON_AVENTURE*1..10]-(m))
  WHERE n.name = 'Jules Cesar' AND m.name = 'Epidemais'
RETURN p, length(p)
//╒═════════════════════════════════════════════════════╤═════════╕
//│p                                                    │length(p)│
//╞═════════════════════════════════════════════════════╪═════════╡
//│(:PERSONNAGE {personnageid: 91,nationalite: "Romain",│2        │
//│name: "Jules Cesar",personnagetype: "Les Romains"})-[│         │
//│:COMPAGNON_AVENTURE]->(:PERSONNAGE {personnageid: 34,│         │
//│nationalite: "Romain",name: "Caius Obtus",personnaget│         │
//│ype: "Les Romains"})-[:COMPAGNON_AVENTURE]->(:PERSONN│         │
//│AGE {personnageid: 65,nationalite: "Phenicien",name: │         │
//│"Epidemais",personnagetype: "Les autres"})           │         │
//└─────────────────────────────────────────────────────┴─────────┘

// Afficher le plus long chemin de type COMPAGNON_AVENTURE et sa longueur entre Jules
// Cesar et Brutus (graphe non-dirigé).
MATCH p=(n)-[:COMPAGNON_AVENTURE*]-(m)
  WHERE n.name = 'Jules Cesar' AND m.name = 'Brutus'
RETURN p, length(p) ORDER BY length(p) DESC LIMIT 1
//╒═════════════════════════════════════════════════════╤═════════╕
//│p                                                    │length(p)│
//╞═════════════════════════════════════════════════════╪═════════╡
//│(:PERSONNAGE {personnageid: 91,nationalite: "Romain",│8        │
//│name: "Jules Cesar",personnagetype: "Les Romains"})-[│         │
//│:COMPAGNON_AVENTURE]->(:PERSONNAGE {personnageid: 56,│         │
//│nationalite: "Egyptienne",name: "Cleopatre",personnag│         │
//│etype: "Les autres"})-[:COMPAGNON_AVENTURE]->(:PERSON│         │
//│NAGE {personnageid: 44,nationalite: "Romain/Egyptien"│         │...

// Afficher les 3 noeuds qui ont le degré le plus élevé. Affichez pour chacun de ces noeuds
// son nom et son degré. Pour calculer le degré considérer uniquement les arcs de type
// NATIONALITE ou PERSONNAGE_TYPE.
MATCH (n)-[r ]-(m)
  WHERE type(r) IN ['NATIONALITE', 'PERSONNAGE_TYPE']
WITH n, count(DISTINCT m) AS degree
RETURN n.name, degree ORDER BY degree DESC
LIMIT 3
// Autre solution
MATCH (n)-[r:NATIONALITE|PERSONNAGE_TYPE]-()
RETURN n.name, count(DISTINCT r) AS degree
  ORDER BY degree DESC
  LIMIT 3
//╒═════════════╤══════╕
//│n.name       │degree│
//╞═════════════╪══════╡
//│"Romain"     │6     │
//├─────────────┼──────┤
//│"Les Romains"│6     │
//├─────────────┼──────┤
//│"Les autres" │4     │
//└─────────────┴──────┘

// Afficher pour chaque couple de personnages reliés par un arc (non-dirigé) de type
// COMPAGNON_AVENTURE le nombre d'albums qu'ils ont en commun
// (afficher le triplet contenant les noms des personnages et le nombre d'albums en commun).
// Chaque couple de personnages doit apparaître une seule fois.
// Trier par nombre total d'albums décroissant.
MATCH (n)-[r:APPARAIT_DANS]->(a)<-[:APPARAIT_DANS]-(m),
      (n)-[t:COMPAGNON_AVENTURE]-(m)
  WHERE n.name < m.name
RETURN n.name, m.name, count(DISTINCT r) AS total
  ORDER BY total DESC
//╒══════════════════════════╤═════════════╤═════╕
//│n.name                    │m.name       │total│
//╞══════════════════════════╪═════════════╪═════╡
//│"Cleopatre"               │"Jules Cesar"│3    │
//├──────────────────────────┼─────────────┼─────┤
//│"Cleopatre"               │"Numerobis"  │2    │
//├──────────────────────────┼─────────────┼─────┤
//│"Cesarion (Ptolemee XVI)" │"Cleopatre"  │1    │
//├──────────────────────────┼─────────────┼─────┤
//│"Caius Obtus"             │"Jules Cesar"│1    │
//├──────────────────────────┼─────────────┼─────┤
//│"Caligula Alavacomgetepus"│"Jules Cesar"│1    │
//└──────────────────────────┴─────────────┴─────┘

// Modifier la requête précédente afin d'ajouter à l'arc de type COMPAGNON_AVENTURE qui
// relie les personnages une propriété 'albums' dont la valeur est le nombre total d'albums en
// commun.
// Il s'agit ici d'un pipeline d'opérations (on calcule d'abord le nombre total d'albums avant
// d'affecter la valeur à l'étiquette) avant le return ⇒ utiliser WITH pour enchaîner les opérations.
MATCH (n)-[r:APPARAIT_DANS]->(a)<-[:APPARAIT_DANS]-(m),
      (n)-[t:COMPAGNON_AVENTURE]-(m)
  WHERE n.name < m.name
WITH n, m, t, count(DISTINCT r) AS total
SET t.albums = total
RETURN DISTINCT n.name, m.name, t.albums
  ORDER BY t.albums DESC
//╒══════════════════════════╤═════════════╤════════╕
//│n.name                    │m.name       │t.albums│
//╞══════════════════════════╪═════════════╪════════╡
//│"Cleopatre"               │"Jules Cesar"│3       │
//├──────────────────────────┼─────────────┼────────┤
//│"Cleopatre"               │"Numerobis"  │2       │
//├──────────────────────────┼─────────────┼────────┤
//│"Cesarion (Ptolemee XVI)" │"Cleopatre"  │1       │
//├──────────────────────────┼─────────────┼────────┤
//│"Caius Obtus"             │"Jules Cesar"│1       │
//├──────────────────────────┼─────────────┼────────┤
//│"Caligula Alavacomgetepus"│"Jules Cesar"│1       │
//└──────────────────────────┴─────────────┴────────┘


// Degré total des noeuds
// 1. Afficher pour chaque valeur de degré le nombre de noeuds avec ce degré. Considérer tous
// les arcs, ordonner par degré
MATCH (n)-[r ]-()
WITH n, count(DISTINCT r) AS degree
RETURN degree, count(n) ORDER BY degree ASC
//╒══════╤═════╕
//│degree│nodes│
//╞══════╪═════╡
//│1     │23   │
//├──────┼─────┤
//│2     │2    │
//├──────┼─────┤
//│3     │7    │
//├──────┼─────┤
//│4     │2    │...

// 2. Pour chaque noeud enregistrer son degré comme nouvelle propriété.
// Chacune de ces questions impliquent un enchaînement de deux opérations (utiliser WITH).
MATCH (n)-[r ]-()
WITH n, count(DISTINCT r) AS degree
SET n.degree = degree
RETURN n.name, n.degree ORDER BY degree ASC
//╒═════════════════════════════╤════════╕
//│n.name                       │n.degree│
//╞═════════════════════════════╪════════╡
//│"Egyptienne"                 │1       │
//├─────────────────────────────┼────────┤
//│"Romain/Egyptien"            │1       │
//├─────────────────────────────┼────────┤
//│"Asterix le Gaulois"         │1       │...

// Afficher pour chaque noeud son nom et son degré sortant. Pour les noeuds sans liens
// sortants afficher 0. Ordonner par ordre décroissant des degrés.
// Considérer uniquement les arcs de type NATIONALITE et PERSONNAGE_TYPE.
MATCH (n)-[r:NATIONALITE|PERSONNAGE_TYPE]->()
RETURN DISTINCT n.name AS Node, count(r) AS Outdegree
  ORDER BY Outdegree
UNION
MATCH (a)-[r:NATIONALITE|PERSONNAGE_TYPE]->(b)
  WHERE NOT((b)-[:COMPAGNON_AVENTURE]->())
RETURN DISTINCT b.name AS Node, 0 AS Outdegree
//╒══════════════════════════╤═════════╕
//│Node                      │Outdegree│
//╞══════════════════════════╪═════════╡
//│"Cleopatre"               │2        │
//├──────────────────────────┼─────────┤
//│"Cesarion (Ptolemee XVI)" │2        │
//├──────────────────────────┼─────────┤
//...
//├──────────────────────────┼─────────┤
//│"Egyptienne"              │0        │
//├──────────────────────────┼─────────┤...

