-- Marketing Campaign Analysis Queries

-- Query 1: Overall KPIs
SELECT 
    COUNT(*) AS Total_Customers,
    ROUND(AVG(Total_Spend), 2) AS Avg_Customer_Spend,
    ROUND(AVG(Total_Campaigns_Accepted), 2) AS Avg_Campaigns_Accepted
FROM campaign_data;

-- Query 2: Best Performing Campaign
SELECT 
    SUM(AcceptedCmp1) AS Campaign_1,
    SUM(AcceptedCmp2) AS Campaign_2,
    SUM(AcceptedCmp3) AS Campaign_3,
    SUM(AcceptedCmp4) AS Campaign_4,
    SUM(AcceptedCmp5) AS Campaign_5
FROM campaign_data;

-- Query 3: Spending by Education Level
SELECT 
    Education,
    COUNT(*) AS Customer_Count,
    ROUND(AVG(Total_Spend), 2) AS Avg_Spend,
    ROUND(AVG(Total_Campaigns_Accepted), 2) AS Avg_Response_Rate
FROM campaign_data
GROUP BY Education
ORDER BY Avg_Spend DESC;

-- Query 4: Customer Value Segments
SELECT 
    CASE 
        WHEN Total_Spend > 1000 THEN 'High Value'
        WHEN Total_Spend BETWEEN 500 AND 1000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS Customer_Segment,
    COUNT(*) AS Count,
    ROUND(AVG(Total_Campaigns_Accepted), 2) AS Avg_Campaign_Response
FROM campaign_data
GROUP BY 
    CASE 
        WHEN Total_Spend > 1000 THEN 'High Value'
        WHEN Total_Spend BETWEEN 500 AND 1000 THEN 'Medium Value'
        ELSE 'Low Value'
    END;

-- Query 5: Response Rate by Age Group
SELECT 
    CASE 
        WHEN Age < 35 THEN 'Young (< 35)'
        WHEN Age BETWEEN 35 AND 50 THEN 'Mid-Age (35-50)'
        ELSE 'Senior (50+)'
    END AS Age_Group,
    COUNT(*) AS Customers,
    ROUND(AVG(Total_Campaigns_Accepted), 2) AS Avg_Campaigns_Accepted,
    ROUND(AVG(Total_Spend), 2) AS Avg_Spend
FROM campaign_data
GROUP BY 
    CASE 
        WHEN Age < 35 THEN 'Young (< 35)'
        WHEN Age BETWEEN 35 AND 50 THEN 'Mid-Age (35-50)'
        ELSE 'Senior (50+)'
    END;