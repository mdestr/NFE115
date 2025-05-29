//Créer un nouveau nœud :
CREATE (jim:Person {name: 'Jim', age: 47})

//Effacer le nœud (et ses éventuelles relations) :
MATCH (n) DETACH DELETE n

//Voir le nœud créé :
MATCH (n:Person) WHERE n.name='Jim' RETURN n

/*
╒═══════════════════════════════╕
│n                              │
╞═══════════════════════════════╡
│(:Person {name: "Jim",age: 47})│
└───────────────────────────────┘*/

//Ajouter une étiquette supplémentaire 'Employee'
MATCH (n:Person {name:'Jim'})
SET n:Employee RETURN n.name, labels(n) as labels
/*
╒══════╤══════════════════════╕
│n.name│labels                │
╞══════╪══════════════════════╡
│"Jim" │["Person", "Employee"]│
└──────┴──────────────────────┘*/

//Ajouter une propriété supplémentaire (la modifier si elle existe) :
MATCH (n:Person {name:'Jim'})
SET n.job='programmer' RETURN properties(n)
/*
╒═════════════════════════════════════════╕
│properties(n)                            │
╞═════════════════════════════════════════╡
│{name: "Jim", age: 47, job: "programmer"}│
└─────────────────────────────────────────┘*/

//Pour les enlever : REMOVE
MATCH(n) WHERE n.emploi IS not NULL
SET n.emploi=n.job REMOVE n.job RETURN properties(n)

//Ajouter d’autres nœuds en relation avec Jim
MATCH (jim:Person {name: 'Jim'})
CREATE (sally:Person:Employee {name: 'Sally', age: 28}),
       (john:Person:Employee {name: 'John', age: 30}),
       (proj:Project {title: 'Graph Databases', town: 'Paris'}),
       (dept:Department {name: '4FUTURE'}),
       (jim)-[:MANAGER {since:'01/09/2015'}]->(sally),
       (jim)-[:WORKS_WITH {since:'01/09/2015'}]->(sally),
       (sally)-[:WORKS_WITH {since:'02/05/2014'}]->(john),
       (jim)-[:COORDINATES {since:'02/03/2015'}]->(proj),
       (sally)-[:PARTICIPATES {since:'02/03/2015'}]->(proj),
       (sally)-[:BELONGS_TO]->(dept),
       (john)-[:BELONGS_TO]->(dept)

// Tous les nœuds du graphe
MATCH(n) RETURN n
/*
╒══════════════════════════════════════════════════════════╕
│n                                                         │
╞══════════════════════════════════════════════════════════╡
│(:Person:Employee {name: "Jim",job: "programmer",age: 47})│
├──────────────────────────────────────────────────────────┤
│(:Person:Employee {name: "Sally",age: 28})                │
├──────────────────────────────────────────────────────────┤
│(:Person:Employee {name: "John",age: 30})                 │
├──────────────────────────────────────────────────────────┤
│(:Project {town: "Paris",title: "Graph Databases"})       │
├──────────────────────────────────────────────────────────┤
│(:Department {name: "4FUTURE"})                           │
└──────────────────────────────────────────────────────────┘*/

//Tous les nœuds qui on une relation avec un autre noeud
MATCH(n) –[] -> () RETURN n
/*
╒══════════════════════════════════════════════════════════╕
│n                                                         │
╞══════════════════════════════════════════════════════════╡
│(:Employee:Person {name: "Jim",job: "programmer",age: 47})│
├──────────────────────────────────────────────────────────┤
│(:Person:Employee {name: "Jim",job: "programmer",age: 47})│
├──────────────────────────────────────────────────────────┤
│(:Person:Employee {name: "Jim",job: "programmer",age: 47})│
├──────────────────────────────────────────────────────────┤
│(:Employee:Person {name: "Sally",age: 28})                │
├──────────────────────────────────────────────────────────┤
│(:Person:Employee {name: "Sally",age: 28})                │
├──────────────────────────────────────────────────────────┤
│(:Person:Employee {name: "Sally",age: 28})                │
├──────────────────────────────────────────────────────────┤
│(:Employee:Person {name: "John",age: 30})                 │
└──────────────────────────────────────────────────────────┘*/


//Toutes les relations de John (indépendamment de la direction)
MATCH (john {name :"John"}) – [r ] - ()
RETURN TYPE(r)
/*
╒════════════╕
│TYPE(r)     │
╞════════════╡
│"WORKS_WITH"│
├────────────┤
│"BELONGS_TO"│
└────────────┘*/

//Tous les noms d'employés avec les noms de leur département :
MATCH (e: Employee) –[]-> (d: Department)
RETURN e.name, d.name
/*
╒═══════╤═════════╕
│e.name │d.name   │
╞═══════╪═════════╡
│"Sally"│"4FUTURE"│
├───────┼─────────┤
│"John" │"4FUTURE"│
└───────┴─────────┘*/

// Trouver Jim et ses subordonnés :
MATCH (jim :Person {name : 'Jim'}) - [:MANAGER]->(sub)
RETURN jim, sub
/*
╒══════════════════════════════════════════════════════════╤══════════════════════════════════════════╕
│jim                                                       │sub                                       │
╞══════════════════════════════════════════════════════════╪══════════════════════════════════════════╡
│(:Person:Employee {name: "Jim",job: "programmer",age: 47})│(:Person:Employee {name: "Sally",age: 28})│
└──────────────────────────────────────────────────────────┴──────────────────────────────────────────┘*/

// Depuis quand participe Sally au projet "Graph Databases" ?
MATCH (sally:Employee { name : 'Sally' })
MATCH (projet:Project { title :'Graph Databases' })
MATCH (sally)-[r:PARTICIPATES] -> (projet)
RETURN r.since
/*
╒════════════╕
│r.since     │
╞════════════╡
│"02/03/2015"│
└────────────┘*/

// Tous les projets à Paris dans lesquels a travaillé Sally
MATCH (sally:Employee)-[:PARTICIPATES]->(project)
  WHERE sally.name="Sally" AND project.town ="Paris"
RETURN project.title
/*
╒═════════════════╕
│project.title    │
╞═════════════════╡
│"Graph Databases"│
└─────────────────┘*/

// Pour chaque employé le nom des chefs des projets dans lesquels il travaille :
MATCH (e)-[:PARTICIPATES]->(p)<-[:COORDINATES]-(c)
RETURN e.name, c.name
/*
╒═══════╤══════╕
│e.name │c.name│
╞═══════╪══════╡
│"Sally"│"Jim" │
└───────┴──────┘*/

// Qui est le plus âgé parmi Jim et Sally ?
MATCH(p : Person)
  WHERE p.name='Jim' OR p.name='Sally'
RETURN p.name as oldest
  ORDER BY p.age DESC LIMIT 1
/*
╒══════╕
│oldest│
╞══════╡
│"Jim" │
└──────┘*/

// Les 2 personnes les plus âgées :
MATCH (p:Person)
RETURN p.name
  ORDER BY p.age DESC LIMIT 2
/*
╒══════╕
│p.name│
╞══════╡
│"Jim" │
├──────┤
│"John"│
└──────┘*/

// Les projets dans lesquels travaille Sally et dans lesquels ne travaille pas John
MATCH (sally:Person {name:"Sally"})-[:PARTICIPATES]->(project)
MATCH (john:Person {name:"John"})
  WHERE NOT (john)-[:PARTICIPATES]->(project)
RETURN DISTINCT project.title
/*
╒═════════════════╕
│project.title    │
╞═════════════════╡
│"Graph Databases"│
└─────────────────┘*/

// Utilisation COUNT :
// Nombre total de nœuds du graphe :
MATCH(n) RETURN COUNT(n)
/*
╒════════╕
│COUNT(n)│
╞════════╡
│5       │
└────────┘*/

// Nombre total de relations dans le graphe :
MATCH () –[]-> () RETURN COUNT(*)
/*
╒════════╕
│COUNT(*)│
╞════════╡
│7       │
└────────┘*/

// Les 10 employés qui ont travaillé dans le plus de projets :
MATCH (e:Employee)-[:PARTICIPATES]->(p)
RETURN e.name, count(p)
  ORDER BY count(p) DESC LIMIT 10
/*
╒═══════╤════════╕
│e.name │count(p)│
╞═══════╪════════╡
│"Sally"│1       │
└───────┴────────┘*/

/*→ Autres fonctions d'agrégation : min, max, sum, collect
Agrégation :
• Similaire au GROUP BY en SQL
• e.name présent dans RETURN → utilisé pour partitionner les données,  count sera appliqué sur chaque partition
• Utilisation DISTINCT (count (DISTINCT p)) pour compter uniquement les valeurs uniques
Pour chaque nœud ses étiquettes et le nombre total de connexions */
MATCH (n) -- () RETURN n, labels(n), count(*)
/*
╒══════════════════════════════════════════════════════════╤══════════════════════╤════════╕
│n                                                         │labels(n)             │count(*)│
╞══════════════════════════════════════════════════════════╪══════════════════════╪════════╡
│(:Person:Employee {name: "Jim",job: "programmer",age: 47})│["Person", "Employee"]│3       │
├──────────────────────────────────────────────────────────┼──────────────────────┼────────┤
│(:Person:Employee {name: "Sally",age: 28})                │["Person", "Employee"]│5       │
├──────────────────────────────────────────────────────────┼──────────────────────┼────────┤
│(:Project {town: "Paris",title: "Graph Databases"})       │["Project"]           │2       │
├──────────────────────────────────────────────────────────┼──────────────────────┼────────┤
│(:Person:Employee {name: "John",age: 30})                 │["Person", "Employee"]│2       │
├──────────────────────────────────────────────────────────┼──────────────────────┼────────┤
│(:Department {name: "4FUTURE"})                           │["Department"]        │2       │
└──────────────────────────────────────────────────────────┴──────────────────────┴────────┘*/

// Pour chaque type (étiquette) de relation le nombre de relations de ce type
MATCH () -[r] ->() RETURN type(r), count(*)
/*
╒══════════════╤════════╕
│type(r)       │count(*)│
╞══════════════╪════════╡
│"MANAGER"     │1       │
├──────────────┼────────┤
│"WORKS_WITH"  │2       │
├──────────────┼────────┤
│"COORDINATES" │1       │
├──────────────┼────────┤
│"PARTICIPATES"│1       │
├──────────────┼────────┤
│"BELONGS_TO"  │2       │
└──────────────┴────────┘*/

// Le collègue (WORKS_WITH) de Jim et le collègue (WORKS_WITH) de son collègue
MATCH (jim)-[:WORKS_WITH*1..2]-(foaf)
  WHERE jim.name="Jim"
RETURN foaf.name

/*
╒═════════╕
│foaf.name│
╞═════════╡
│"Sally"  │
├─────────┤
│"John"   │
└─────────┘
*/

// Les employés qui travaillent avec les employés qui travaillent avec Jim et avec lesquels Jim n'a jamais travaillé:
MATCH (fof)-[:WORKS_WITH*2]-(jim:Person)
  WHERE jim.name = "Jim" and NOT (jim)-[:WORKS_WITH]-(fof)
RETURN DISTINCT fof.name
/*
╒════════╕
│fof.name│
╞════════╡
│"John"  │
└────────┘*/

// La longueur du plus court chemin entre "Jim" et "John" :
MATCH p=shortestPath( (jim)-[*1..10]-(john) )
  WHERE jim.name="Jim" and john.name = "John"
RETURN length(p)
/*
╒═════════╕
│length(p)│
╞═════════╡
│2        │
└─────────┘*/

//Afficher le nom des personnes sur le plus court chemin :
MATCH p=shortestPath( (jim)-[*1..10]-(john) )
  WHERE jim.name="Jim" and john.name = "John"
RETURN [ n in nodes(p) | n.name]
/*
╒═════════════════════════╕
│[ n in nodes(p) | n.name]│
╞═════════════════════════╡
│["Jim", "Sally", "John"] │
└─────────────────────────┘*/

//Tous les plus courts chemins entre 'Jim' et 'John' :
MATCH p=allShortestPaths((jim)-[*1..10]-(john))
  WHERE jim.name ="Jim" and john.name="John"
RETURN [ n in nodes(p) | n.name]
/*
╒═════════════════════════╕
│[ n in nodes(p) | n.name]│
╞═════════════════════════╡
│["Jim", "Sally", "John"] │
├─────────────────────────┤
│["Jim", "Sally", "John"] │
└─────────────────────────┘*/

/*Pour des requêtes avec un pipeline d'opérations, relie les différentes opérations entre elles .
// Exemple : Appliquer un filtre sur le résultat d'une fonction d'agrégation*/
MATCH (sally {name : 'Sally'})-->(other)-->(x)
WITH other, count(DISTINCT x) AS nbfoaf
  WHERE nbfoaf >=1
RETURN other, nbfoaf
/*
╒═════════════════════════════════════════╤══════╕
│other                                    │nbfoaf│
╞═════════════════════════════════════════╪══════╡
│(:Person:Employee {name: "John",age: 30})│1     │
└─────────────────────────────────────────┴──────┘*/

// Trier les résultats avant de les retourner dans une liste
MATCH (n) WHERE n.name is not null
WITH n
  ORDER BY n.name DESC LIMIT 4
RETURN collect(n.name)
/*
╒═══════════════════════════════════╕
│collect(n.name)                    │
╞═══════════════════════════════════╡
│["Sally", "John", "Jim", "4FUTURE"]│
└───────────────────────────────────┘*/

/*Faire des traitements successifs : En partant de 'Graph Databases', trouver les voisins,
les classer par nom, en garder seulement le premier et afficher ensuite ses voisins*/
MATCH (p {title: 'Graph Databases'})--(other)
WITH other, p
  ORDER BY other.name DESC LIMIT 1
MATCH (other)--(neigh) WHERE neigh <> p
RETURN distinct neigh.name
/*
╒══════════╕
│neigh.name│
╞══════════╡
│"Jim"     │
├──────────┤
│"John"    │
├──────────┤
│"4FUTURE" │
└──────────┘*/