#title: Départements français actuels avec leur population (rang préféré) — sortie simplifiée
SELECT
  ?codeInsee
  ?itemLabel
  ?population
WHERE {
  SERVICE wikibase:label {
    bd:serviceParam wikibase:language "fr,[AUTO_LANGUAGE],en" .
  }
 
  # --- Départements actuels ---
  {
    wd:Q6465 ^(wdt:P279*) ?instance .
    ?item p:P31 ?typeStatement .
    ?typeStatement ps:P31 ?instance .
    FILTER(NOT EXISTS { ?typeStatement pq:P582 ?end. })
  }
  UNION
  {
    ?item p:P31 ?typeStatement .
    ?typeStatement ps:P31 wd:Q22923920 ;
                  pq:P2868 wd:Q6465 .
  }
 
  # Code INSEE
  ?item wdt:P2586 ?codeInsee .
 
  # Population obligatoire, rang préféré
  ?item p:P1082 ?popStatement .
  ?popStatement wikibase:rank wikibase:PreferredRank .
  ?popStatement ps:P1082 ?population .
}
ORDER BY xsd:integer(?codeInsee)