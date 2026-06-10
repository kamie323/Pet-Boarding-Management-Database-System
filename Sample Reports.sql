--Query
-- Most popular service and income
SELECT 
    s.Service_Name AS 'Service Name',
    COUNT(b.Booking_ID) AS 'Booking Times',
    SUM(p.Amount) AS 'Total revenue',
    AVG(s.Service_Rating) AS 'Average Rate'
FROM Service s
LEFT JOIN Booking b ON s.Service_ID = b.Service_ID
LEFT JOIN Payment p ON b.Booking_ID = p.Booking_ID
GROUP BY s.Service_ID, s.Service_Name
ORDER BY COUNT(b.Booking_ID) DESC;

-- Cage usage report
SELECT 
    TypeName AS 'Cage Type',
    TotalQuantity AS 'Total Quantity',
    AvailableQuantity AS 'Available Quantity',
    (TotalQuantity - AvailableQuantity) AS 'Used Quantity',
    ROUND(((TotalQuantity - AvailableQuantity) * 100.0 / TotalQuantity), 2) AS 'Used Rate(%)'
FROM Cage
ORDER BY 使用率 DESC;

-- Training effectiveness analysis
SELECT 
    tp.TrainingDate AS 'Training Date',
    tp.SkillsCovered AS 'Training Content',
    tp.TrainingRating AS 'Rating',
    p.Name AS 'Pet Name',
    e.FirstName AS 'Trainer'
FROM TrainingProgress tp
JOIN Booking b ON tp.BookingID = b.Booking_ID
JOIN Pet p ON b.Pet_ID = p.Pet_ID AND b.Owner_ID = p.Owner_ID
JOIN Employee e ON b.Employee_ID = e.EmployeeID
ORDER BY tp.TrainingRating DESC;

