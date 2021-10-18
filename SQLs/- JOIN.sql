--CREATE table bi.account_invoice_report
SELECT *
FROM bi.account_invoice_report AS AIR
JOIN public.account_payment AS AP ON AIR.id=AP.id

SELECT type,
count (type)
from bi.account_invoice_report
group by 1


SELECT 
distinct (type)
from bi.account_invoice_report
group by 1