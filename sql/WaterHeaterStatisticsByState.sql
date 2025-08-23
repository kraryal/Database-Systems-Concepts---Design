USE CS6400_PROJECT;

SELECT  p.StateName, ROUND(AVG(Tanksize), 1),AVG(BTURating),AVG(Temperature)
                FROM PostalCode p 
                JOIN Household h
                ON p.PostalCode = h.PostalCode
                JOIN Appliances a
                ON a.email = h.email
                JOIN Waterheater w
                ON w.email = p.postalcode
                GROUP BY p.StateName;