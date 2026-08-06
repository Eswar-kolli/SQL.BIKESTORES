use bikestores;
--21.Check if phone numbers contain dashes--
SELECT phone,CHARINDEX(phone,'-')
FROM sales.customers
WHERE phone IS NOT NULL;
--