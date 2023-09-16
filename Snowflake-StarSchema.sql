--SELECT * FROM dbo.movie m 
--LEFT JOIN dbo.production_country pc ON m.movie_id = pc.movie_id
--LEFT JOIN dbo.country c on  pc.country_id = c.country_id
--WHERE vote_average >= 7

CREATE VIEW CountryOfMovie as (
SELECT movie_id, country_name FROM dbo.production_country pc 
LEFT JOIN dbo.country c ON pc.country_id = c.country_id
) 

CREATE VIEW LanguageOfMovie AS (
SELECT movie_id, language_name, language_role FROM dbo.movie_languages ml
LEFT JOIN dbo.language l ON ml.language_id = l.language_id
LEFT JOIN dbo.language_role lr on ml.language_role_id = lr.role_id
) 

CREATE VIEW MovieGenre AS (
SELECT movie_id, genre_name FROM dbo.movie_genres mg
LEFT JOIN dbo.genre g ON mg.genre_id = g.genre_id
)

CREATE VIEW MovieKeywords AS (
SELECT movie_id, keyword_name FROM dbo.movie_keywords mk
LEFT JOIN dbo.keyword k ON mk.keyword_id = k.keyword_id
)

CREATE VIEW MovieCompany AS (
SELECT movie_id, company_name FROM dbo.movie_company mc
LEFT JOIN dbo.production_company pc ON mc.company_id = pc.company_id
)

CREATE VIEW MovieCast AS (
SELECT mc.movie_id, mc.person_id, mc.character_name, mc.cast_order 
, g.gender
, p.person_name
FROM dbo.movie_cast mc
LEFT JOIN dbo.gender g ON mc.gender_id = g.gender_id
LEFT JOIN dbo.person p ON mc.person_id = p.person_id
)

CREATE VIEW CrewData AS (
SELECT mcrew.person_id, mcrew.movie_id, mcrew.job
, p.person_name
, d.department_name
--, mcrew.person_id + ' ' + mcrew.movie_id  as MapColumn
, CONCAT (mcrew.person_id, '_', mcrew.movie_id) as MappingColumn
FROM dbo.movie_crew mcrew
LEFT JOIN dbo.person p ON mcrew.person_id = p.person_id
LEFT JOIN dbo.department d ON mcrew.department_id = d.department_id
) 

SELECT COUNT (*) FROM dbo.movie
WHERE title NOT LIKE '?%' AND budget > 0 AND revenue > 0