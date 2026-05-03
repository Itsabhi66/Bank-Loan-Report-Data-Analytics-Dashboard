# Total Loan Application 
select address_state, count(*) as total_Loan_Application from financial_loan group by address_state order by total_Loan_Application desc
select MONTHNAME(issue_date) as month_name, count(*) as total_Loan_Application from financial_loan group by month_name order by total_Loan_Application desc
select count(*) as total_Loan_Application from financial_loan

#MTD Loan Applications
SELECT COUNT(id) AS Total_Applications FROM financial_loan
WHERE MONTH(issue_date) = 12



# Total funded amount
select address_state, sum(loan_amount) as total_funded_amount from financial_loan group by address_state order by total_funded_amount desc
select sum(loan_amount) as total_funded_amount from financial_loan

# Total Amount Received
select address_state, sum(total_payment) as total_Received_amount from financial_loan group by address_state order by total_Received_amount desc
select sum(total_payment) as total_Received_amount from financial_loan

#Summary in state-wise
select address_state, sum(loan_amount) as total_funded_amount, sum(total_payment) as total_Received_amount , (sum(loan_amount)-sum(total_payment)) as Pending_amount from 
financial_loan group by address_state order by Pending_amount

#Average interest Rate
select address_state, Round(avg(int_rate*100)) as avg_interest_rate from financial_loan group by address_state order by avg_interest_rate desc
select Round(avg(int_rate*100)) as avg_interest_rate from financial_loan

#Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM financial_loan

#MTD Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM financial_loan
WHERE MONTH(issue_date) = 12

#PMTD Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM financial_loan
WHERE MONTH(issue_date) = 11

#MTD Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected FROM financial_loan
WHERE MONTH(issue_date) = 12

#PMTD Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Collected FROM financial_loan
WHERE MONTH(issue_date) = 11

#MTD Average Interest
SELECT AVG(int_rate)*100 AS MTD_Avg_Int_Rate FROM financial_loan
WHERE MONTH(issue_date) = 12

#PMTD Average Interest
SELECT AVG(int_rate)*100 AS PMTD_Avg_Int_Rate FROM financial_loan
WHERE MONTH(issue_date) = 11

#Avg DTI
SELECT AVG(dti)*100 AS Avg_DTI FROM financial_loan

#MTD Avg DTI
SELECT AVG(dti)*100 AS MTD_Avg_DTI FROM financial_loan
WHERE MONTH(issue_date) = 12

#PMTD Avg DTI
SELECT AVG(dti)*100 AS PMTD_Avg_DTI FROM financial_loan
WHERE MONTH(issue_date) = 11

#GOOD LOAN ISSUED

#Good Loan Percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
	COUNT(id) AS Good_Loan_Percentage
FROM financial_loan

#Good Loan Applications
SELECT COUNT(id) AS Good_Loan_Applications FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

#Good Loan Funded Amount
SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

#Good Loan Amount Received
SELECT SUM(total_payment) AS Good_Loan_amount_received FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

#BAD LOAN ISSUED
#Bad Loan Percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM financial_loan

#Bad Loan Applications
SELECT COUNT(id) AS Bad_Loan_Applications FROM financial_loan
WHERE loan_status = 'Charged Off'

#Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM financial_loan
WHERE loan_status = 'Charged Off'

#Bad Loan Amount Received
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM financial_loan
WHERE loan_status = 'Charged Off'

#LOAN STATUS
	SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        financial_loan
    GROUP BY
        loan_status

SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM financial_loan
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status

#B.	BANK LOAN REPORT | OVERVIEW
#MONTH-WISE
SELECT 
	MONTH(issue_date) AS Month_Munber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)

#STATE
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY address_state
ORDER BY address_state

#TERM
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY term
ORDER BY term

#EMPLOYEE LENGTH
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY emp_length
ORDER BY emp_length

#PURPOSE
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY purpose
ORDER BY purpose

#HOME OWNERSHIP
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY home_ownership
ORDER BY home_ownership



