# TABLE INFO:
PRAGMA TABLE_info("Customer-Churn");

# TOTAL COUNT OF CHURNS:

SELECT count(*)
FROM "Customer-Churn"
WHERE Churn ="Yes";

# TOTAL COUNT OF CHURN BY Contract:

SELECT
    Contract,
    COUNT(*) AS total_customers
FROM "Customer-Churn"
WHERE Churn = 'Yes'
GROUP BY Contract;

# TOTAL count OF CHURN BY MonthlyCharges:

select count(MonthlyCharges),Churn from "Customer-Churn"
GROUP by Churn;

# AVGS OF CHURN :
SELECT
    Churn,
    AVG(MonthlyCharges) AS avg_monthly_charge,
	avg(tenure) as avg_tenure_charge
FROM "Customer-Churn"
GROUP BY Churn;

# GROUP InternetService AND SeniorCitizenALSO:

SELECT InternetService,count(*) as Churn_count FROM "Customer-Churn"
where Churn= "Yes"
GROUP by InternetService;


SELECT
    SeniorCitizen,
    COUNT(*) AS churn_count
FROM "Customer-Churn"
WHERE Churn = 'Yes'
GROUP BY SeniorCitizen;