SELECT *
FROM `nsw crime 1995 - 2012`
LIMIT 10;

SELECT DISTINCT `Offence category`
FROM `nsw crime 1995 - 2012`;

#Sums of December 1995 and December 2012 and the rate increase of crime by offence
SELECT `Offence category`,
SUM(`Dec 1995`) AS Dec1995_Offence_Count,
SUM(`Dec 2012`) AS Dec2012_Offence_Count,
CAST((SUM(`Dec 2012`) / SUM(`Jan 1995`)) AS DECIMAL(7,2)) AS `Rate_Increase` 
FROM `nsw crime 1995 - 2012`
GROUP BY `Offence category`
ORDER BY `Offence category` ASC;


#Sums of 1995 and 2012 and the rate increase of crime by offence
SELECT `Offence category`,
SUM(`Jan 1995`) + SUM(`Feb 1995`) + SUM(`Mar 1995`) + SUM(`Apr 1995`) + SUM(`May 1995`) + SUM(`Jun 1995`) + SUM(`Jul 1995`) + SUM(`Aug 1995`) + SUM(`Sep 1995`) + SUM(`Oct 1995`) + SUM(`Nov 1995`) + SUM(`Dec 1995`) AS `1995`,
SUM(`Jan 2012`) + SUM(`Feb 2012`) + SUM(`Mar 2012`) + SUM(`Apr 2012`) + SUM(`May 2012`) + SUM(`Jun 2012`) + SUM(`Jul 2012`) + SUM(`Aug 2012`) + SUM(`Sep 2012`) + SUM(`Oct 2012`) + SUM(`Nov 2012`) + SUM(`Dec 2012`) AS `2012`,
(SUM(`Jan 1995`) + SUM(`Feb 1995`) + SUM(`Mar 1995`) + SUM(`Apr 1995`) + SUM(`May 1995`) + SUM(`Jun 1995`) + SUM(`Jul 1995`) + SUM(`Aug 1995`) + SUM(`Sep 1995`) + SUM(`Oct 1995`) + SUM(`Nov 1995`) + SUM(`Dec 1995`)) 
/ 
(SUM(`Jan 2012`) + SUM(`Feb 2012`) + SUM(`Mar 2012`) + SUM(`Apr 2012`) + SUM(`May 2012`) + SUM(`Jun 2012`) + SUM(`Jul 2012`) + SUM(`Aug 2012`) + SUM(`Sep 2012`) + SUM(`Oct 2012`) + SUM(`Nov 2012`) + SUM(`Dec 2012`))
AS Rate_Increase
FROM `nsw crime 1995 - 2012`
GROUP BY `Offence category`
ORDER BY `Offence category` ASC;

#Crime count by Category and Subcategory in NSW
SELECT `Offence category`, Subcategory,
SUM(`Jan 2012`) + SUM(`Feb 2012`) + SUM(`Mar 2012`) + SUM(`Apr 2012`) + SUM(`May 2012`) + SUM(`Jun 2012`) + SUM(`Jul 2012`) + SUM(`Aug 2012`) + SUM(`Sep 2012`) + SUM(`Oct 2012`) + SUM(`Nov 2012`) + SUM(`Dec 2012`) AS `2012`
FROM `nsw crime 1995 - 2012`
GROUP BY `Offence category`, Subcategory
ORDER BY `2012` DESC;

#TOP 10 LGA's with most crime 2012
SELECT LGA,
SUM(`Jan 2012`) + SUM(`Feb 2012`) + SUM(`Mar 2012`) + SUM(`Apr 2012`) + SUM(`May 2012`) + SUM(`Jun 2012`) + SUM(`Jul 2012`) + SUM(`Aug 2012`) + SUM(`Sep 2012`) + SUM(`Oct 2012`) + SUM(`Nov 2012`) + SUM(`Dec 2012`) AS `2012`
FROM `nsw crime 1995 - 2012`
GROUP BY LGA
ORDER BY `2012` DESC
LIMIT 10;

#A look at domestic violence
SELECT LGA, `Offence category`, Subcategory,
SUM(`Jan 1995`) + SUM(`Feb 1995`) + SUM(`Mar 1995`) + SUM(`Apr 1995`) + SUM(`May 1995`) + SUM(`Jun 1995`) + SUM(`Jul 1995`) + SUM(`Aug 1995`) + SUM(`Sep 1995`) + SUM(`Oct 1995`) + SUM(`Nov 1995`) + SUM(`Dec 1995`) AS `1995`,
SUM(`Jan 2012`) + SUM(`Feb 2012`) + SUM(`Mar 2012`) + SUM(`Apr 2012`) + SUM(`May 2012`) + SUM(`Jun 2012`) + SUM(`Jul 2012`) + SUM(`Aug 2012`) + SUM(`Sep 2012`) + SUM(`Oct 2012`) + SUM(`Nov 2012`) + SUM(`Dec 2012`) AS `2012`
FROM `nsw crime 1995 - 2012`
WHERE Subcategory LIKE 'Domestic violence%'
GROUP BY LGA, `Offence category`, Subcategory
ORDER BY `2012` DESC;

#A look at Coffs Harbour
SELECT LGA, `Offence category`, Subcategory,
SUM(`Jan 1995`) + SUM(`Feb 1995`) + SUM(`Mar 1995`) + SUM(`Apr 1995`) + SUM(`May 1995`) + SUM(`Jun 1995`) + SUM(`Jul 1995`) + SUM(`Aug 1995`) + SUM(`Sep 1995`) + SUM(`Oct 1995`) + SUM(`Nov 1995`) + SUM(`Dec 1995`) AS `1995`,
SUM(`Jan 2012`) + SUM(`Feb 2012`) + SUM(`Mar 2012`) + SUM(`Apr 2012`) + SUM(`May 2012`) + SUM(`Jun 2012`) + SUM(`Jul 2012`) + SUM(`Aug 2012`) + SUM(`Sep 2012`) + SUM(`Oct 2012`) + SUM(`Nov 2012`) + SUM(`Dec 2012`) AS `2012`
FROM `nsw crime 1995 - 2012`
WHERE LGA = 'Coffs Harbour'
GROUP BY LGA, `Offence category`, Subcategory
ORDER BY `2012` DESC;