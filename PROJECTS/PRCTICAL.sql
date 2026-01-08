CREATE DATABASE PRACTICAL;

USE PRACTICAL; 

-- ========== 1.CRUD ===========

-- === CREATE ===

-- ======== 1.ORGANIZER TABLE =========
CREATE TABLE Organizers (
    organizer_id INT PRIMARY KEY,
    organizer_name VARCHAR(255),
    contact_email VARCHAR(255),
    phone_number VARCHAR(20)
);

INSERT INTO Organizers (organizer_id, organizer_name, contact_email, phone_number) VALUES
(101, 'Tech Wizards', 'info@techwizards.com', '9876543210'),
(102, 'Music Mania', 'contact@musicmania.com', '9876543211'),
(103, 'Art Hub', 'hello@arthub.org', '9876543212'),
(104, 'Sports Pro', 'support@sportspro.com', '9876543213'),
(105, 'Gourmet Events', 'chef@gourmet.com', '9876543214'),
(106, 'Education First', 'edu@learning.com', '9876543215'),
(107, 'Startup Network', 'pitch@startups.com', '9876543216'),
(108, 'Fashion Fiesta', 'style@fashion.com', '9876543217'),
(109, 'Green Earth', 'save@earth.org', '9876543218'),
(110, 'Gaming Zone', 'play@gaming.com', '9876543219'),
(111, 'Health Care', 'care@health.com', '9876543220'),
(112, 'Business Minds', 'ceo@business.com', '9876543221'),
(113, 'Travel Tales', 'explore@travel.com', '9876543222'),
(114, 'Dance Beats', 'move@dance.com', '9876543223'),
(115, 'Cinema Club', 'movies@cinema.com', '9876543224');

-- ========= 2.VENUES TABLE ==========
CREATE TABLE Venues (
    venue_id INT PRIMARY KEY,
    venue_name VARCHAR(255) NOT NULL,
    location VARCHAR(255),
    capacity INT
);

INSERT INTO Venues (venue_id, venue_name, location, capacity) VALUES
(201, 'Grand Ballroom', 'New York', 500),
(202, 'City Stadium', 'Chicago', 5000),
(203, 'Downtown Gallery', 'San Francisco', 200),
(204, 'Convention Center', 'Las Vegas', 2000),
(205, 'Sunset Beach', 'Miami', 1000),
(206, 'Public Library Hall', 'Boston', 150),
(207, 'Tech Park Plaza', 'Austin', 800),
(208, 'Crystal Palace', 'London', 1200),
(209, 'Royal Garden', 'Delhi', 1500),
(210, 'Oceanic Resort', 'Goa', 600),
(211, 'Mountain Lodge', 'Denver', 300),
(212, 'Metro Multiplex', 'Mumbai', 400),
(213, 'Elite Sports Club', 'Bangalore', 2500),
(214, 'Community Hub', 'Seattle', 100),
(215, 'The Rooftop Lounge', 'Dubai', 250);

-- =========== 3.EVENT TABLE ===========
CREATE TABLE Events (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_date DATE,
    venue_id INT,
    organizer_id INT,
    ticket_price DECIMAL(10, 2),
    total_seats INT,
    available_seats INT,
    FOREIGN KEY (venue_id) REFERENCES Venues(venue_id),
    FOREIGN KEY (organizer_id) REFERENCES Organizers(organizer_id)
);

INSERT INTO Events (event_id, event_name, event_date, venue_id, organizer_id, ticket_price, total_seats, available_seats) VALUES
(301, 'AI Summit 2026', '2026-03-15', 204, 101, 150.00, 500, 450),
(302, 'Rock the Night', '2026-04-20', 202, 102, 75.00, 5000, 4800),
(303, 'Modern Art Expo', '2026-05-10', 203, 103, 20.00, 200, 150),
(304, 'Marathon Expo', '2026-02-12', 213, 104, 0.00, 1000, 900),
(305, 'Food & Wine Fest', '2026-06-05', 205, 105, 120.00, 300, 250),
(306, 'Python Workshop', '2026-07-22', 206, 106, 50.00, 50, 40),
(307, 'Venture Pitch Day', '2026-08-14', 207, 107, 100.00, 300, 280),
(308, 'Summer Fashion Show', '2026-06-15', 208, 108, 200.00, 400, 350),
(309, 'Climate Action Talk', '2026-09-20', 214, 109, 0.00, 100, 80),
(310, 'E-Sports League', '2026-10-05', 210, 110, 30.00, 600, 550),
(311, 'Yoga for All', '2026-01-20', 211, 111, 15.00, 50, 45),
(312, 'Leadership Seminar', '2026-11-12', 201, 112, 500.00, 100, 90),
(313, 'World Heritage Tour', '2026-12-01', 209, 113, 250.00, 40, 35),
(314, 'Classical Dance Night', '2026-03-25', 212, 114, 40.00, 400, 380),
(315, 'Short Film Festival', '2026-02-28', 215, 115, 10.00, 250, 200);

-- ========== 4.ATTENDENS TABLE ===========
CREATE TABLE Attendens (
    attendee_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20)
);

INSERT INTO Attendens (attendee_id, name, email, phone_number) VALUES
(401, 'Rahul Sharma', 'rahul@mail.com', '8888800001'),
(402, 'Priya Verma', 'priya@mail.com', '8888800002'),
(403, 'Amit Khan', 'amit@mail.com', '8888800003'),
(404, 'Sneha Das', 'sneha@mail.com', '8888800004'),
(405, 'Vikram Singh', 'vikram@mail.com', '8888800005'),
(406, 'Anjali Gupta', 'anjali@mail.com', '8888800006'),
(407, 'Karan Malhotra', 'karan@mail.com', '8888800007'),
(408, 'Sonia Rawat', 'sonia@mail.com', '8888800008'),
(409, 'Rohan Mehra', 'rohan@mail.com', '8888800009'),
(410, 'Ishani Iyer', 'ishani@mail.com', '8888800010'),
(411, 'Sameer Jain', 'sameer@mail.com', '8888800011'),
(412, 'Tanvi Joshi', 'tanvi@mail.com', '8888800012'),
(413, 'Arjun Kapoor', 'arjun@mail.com', '8888800013'),
(414, 'Divya Nair', 'divya@mail.com', '8888800014'),
(415, 'Manish Pal', 'manish@mail.com', '8888800015');

-- =========== 5.TICKET TABLE ===========
CREATE TABLE Tickets (
    ticket_id INT PRIMARY KEY,
    event_id INT,
    attendee_id INT,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Confirmed', 'Cancelled', 'Pending'),
    FOREIGN KEY (event_id) REFERENCES Events(event_id),
    FOREIGN KEY (attendee_id) REFERENCES Attendens(attendee_id)
);

INSERT INTO Tickets (ticket_id, event_id, attendee_id, status) VALUES
(501, 301, 401, 'Confirmed'),
(502, 302, 402, 'Confirmed'),
(503, 303, 403, 'Confirmed'),
(504, 304, 404, 'Confirmed'),
(505, 305, 405, 'Pending'),
(506, 306, 406, 'Confirmed'),
(507, 307, 407, 'Confirmed'),
(508, 308, 408, 'Confirmed'),
(509, 309, 409, 'Confirmed'),
(510, 310, 410, 'Cancelled'),
(511, 311, 411, 'Confirmed'),
(512, 312, 412, 'Pending'),
(513, 313, 413, 'Confirmed'),
(514, 314, 414, 'Confirmed'),
(515, 315, 415, 'Confirmed');

-- ========== 6.PAYMENT TABLE ==========
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    ticket_id INT,
    amount_paid DECIMAL(10, 2),
    payment_status ENUM('Success', 'Failed', 'Pending'),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ticket_id) REFERENCES Tickets(ticket_id)
);

INSERT INTO Payments (payment_id, ticket_id, amount_paid, payment_status) VALUES
(601, 501, 150.00, 'Success'),
(602, 502, 75.00, 'Success'),
(603, 503, 20.00, 'Success'),
(604, 504, 0.00, 'Success'),
(605, 505, 120.00, 'Pending'),
(606, 506, 50.00, 'Success'),
(607, 507, 100.00, 'Success'),
(608, 508, 200.00, 'Success'),
(609, 509, 0.00, 'Success'),
(610, 510, 0.00, 'Failed'),
(611, 511, 15.00, 'Success'),
(612, 512, 500.00, 'Pending'),
(613, 513, 250.00, 'Success'),
(614, 514, 40.00, 'Success'),
(615, 515, 10.00, 'Success');

-- === 1.ADD ===
INSERT INTO Organizers 
VALUES (116, 'Tech Innovators', 'contact@techinnovators.com', '9876543333');

INSERT INTO Venues 
VALUES (216, 'Innovation Hall', 'Hyderabad', 700);

INSERT INTO Events 
VALUES (316, 'Cloud Computing Workshop', '2026-04-10', 216, 116, 80.00, 200, 200);



INSERT INTO Attendens 
VALUES (416, 'Neha Patel', 'neha@mail.com', '8888800016');

INSERT INTO Tickets (ticket_id, event_id, attendee_id, status)
VALUES (516, 316, 416, 'Confirmed');

-- === 1.UPDATE ===
UPDATE Organizers
SET phone_number = '9999999999'
WHERE organizer_id = 101;

UPDATE Venues
SET capacity = 550
WHERE venue_id = 201;

UPDATE Events
SET ticket_price = 180.00
WHERE event_id = 301;

UPDATE Attendens
SET email = 'rahul_new@mail.com'
WHERE attendee_id = 401;

UPDATE Tickets
SET status = 'Cancelled'
WHERE ticket_id = 505;

 -- === 1.DELETE ===
DELETE FROM Payments
WHERE payment_id = 615;

DELETE FROM Tickets
WHERE ticket_id = 515;

DELETE FROM Attendens
WHERE attendee_id = 415;

DELETE FROM Events
WHERE event_id = 315;

DELETE FROM ORGANIZERS
WHERE ORGANIZER_ID = 215;

DELETE FROM VENUES
WHERE VENUE_ID = 115;

-- === SEARCH ===
SELECT * FROM Events;

SELECT e.event_name, o.organizer_name
FROM Events e
JOIN Organizers o ON e.organizer_id = o.organizer_id;

SELECT e.event_name, v.venue_name, v.location
FROM Events e
JOIN Venues v ON e.venue_id = v.venue_id;

SELECT t.ticket_id, a.name, e.event_name, t.status
FROM Tickets t
JOIN Attendens a ON t.attendee_id = a.attendee_id
JOIN Events e ON t.event_id = e.event_id;

SELECT * FROM Payments
WHERE payment_status = 'Success';

-- ======== 2.WHERE,HAVING,LIMIT ==========

-- === 1.Get upcoming events happening in a specific city ===
SELECT e.event_name, e.event_date, v.location
FROM Events e
JOIN Venues v ON e.venue_id = v.venue_id
WHERE v.location = 'Delhi'
AND e.event_date > CURDATE();

-- === 2. Retrieve top 5 highest revenue-generating events ===
SELECT e.event_name,
       SUM(p.amount_paid) AS total_revenue
FROM Events e
JOIN Tickets t ON e.event_id = t.event_id
JOIN Payments p ON t.ticket_id = p.ticket_id
WHERE p.payment_status = 'Success'
GROUP BY e.event_id
HAVING total_revenue > 0
ORDER BY total_revenue DESC
LIMIT 5;

-- === 3. Find attendees who booked tickets in the last 7 days ===
SELECT DISTINCT a.name, a.email, t.booking_date
FROM Attendens a
JOIN Tickets t ON a.attendee_id = t.attendee_id
WHERE t.booking_date >= NOW() - INTERVAL 7 DAY;

-- === 3.AND,OR,NOT ===

-- === 1. Retrieve events scheduled in December AND have more than 50% available seats ===
SELECT event_name, event_date, total_seats, available_seats
FROM Events
WHERE MONTH(event_date) = 12
  AND available_seats > (total_seats * 0.5);

-- === 2. List attendees who have booked a ticket OR have a pending payment ===
SELECT DISTINCT a.name, a.email
FROM Attendens a
LEFT JOIN Tickets t ON a.attendee_id = t.attendee_id
LEFT JOIN Payments p ON t.ticket_id = p.ticket_id
WHERE t.ticket_id IS NOT NULL
   OR p.payment_status = 'Pending';
   
-- === 3. Identify events that are NOT fully booked ===
SELECT event_name, total_seats, available_seats
FROM Events
WHERE NOT (available_seats = 0);

-- === 4.ORDER BY , GROUP BY

-- === 1. Sort events by date in ascending order ===
SELECT event_id, event_name, event_date
FROM Events
ORDER BY event_date ASC;

-- === 2. Count the number of attendees per event ===
SELECT e.event_name,
       COUNT(t.attendee_id) AS total_attendees
FROM Events e
LEFT JOIN Tickets t ON e.event_id = t.event_id
GROUP BY e.event_id, e.event_name;

-- === 3. Show the total revenue generated per event ===
SELECT e.event_name,
       SUM(p.amount_paid) AS total_revenue
FROM Events e
JOIN Tickets t ON e.event_id = t.event_id
JOIN Payments p ON t.ticket_id = p.ticket_id
WHERE p.payment_status = 'Success'
GROUP BY e.event_id, e.event_name;

-- === 5. Use Aggregate Functions (SUM, AVG, MAX, MIN, COUNT) ===

-- === 1.Calculate the total revenue generated from all events ===
SELECT SUM(amount_paid) AS total_revenue
FROM Payments
WHERE payment_status = 'Success';

-- === 2.Find the event with the highest number of attendees ===
SELECT e.event_id, e.event_name, COUNT(t.ticket_id) AS total_attendees
FROM Events e
JOIN Tickets t ON e.event_id = t.event_id
GROUP BY e.event_id, e.event_name
ORDER BY total_attendees DESC
LIMIT 1;

-- === 3.Compute the average ticket price across all events ===
SELECT AVG(ticket_price) AS average_ticket_price
FROM Events;

-- === 6.
ALTER TABLE Tickets
ADD CONSTRAINT unique_event_attendee
UNIQUE (event_id, attendee_id);

ALTER TABLE Payments
ADD CONSTRAINT fk_ticket_payment
FOREIGN KEY (ticket_id)
REFERENCES Tickets(ticket_id);

-- === 7.Implement Joins ===

-- === INNER JOIN ===
SELECT e.event_name, e.event_date, v.venue_name, v.location
FROM Events e
INNER JOIN Venues v
ON e.venue_id = v.venue_id;

-- === 2.LEFT JOIN ===
SELECT a.name, t.ticket_id, p.payment_status
FROM Tickets t
LEFT JOIN Payments p ON t.ticket_id = p.ticket_id
JOIN Attendens a ON t.attendee_id = a.attendee_id
WHERE p.payment_status <> 'Success'
   OR p.payment_status IS NULL;

-- === 3.RIGHT JOIN ===
SELECT e.event_name, t.ticket_id
FROM Tickets t
RIGHT JOIN Events e
ON t.event_id = e.event_id
WHERE t.ticket_id IS NULL;

-- === 4.FULL OUTER JOIN ===
SELECT a.attendee_id, a.name
FROM Attendens a
LEFT JOIN Tickets t ON a.attendee_id = t.attendee_id
WHERE t.ticket_id IS NULL;

-- === 8.Subqueries ===

-- === 1.Events with Revenue > Average Ticket Sales ===
SELECT event_name 
FROM Events e
JOIN Tickets t ON e.event_id = t.event_id
JOIN Payments p ON t.ticket_id = p.ticket_id
GROUP BY e.event_name
HAVING SUM(p.amount_paid) > (
    SELECT AVG(total_revenue) 
    FROM (
        SELECT SUM(amount_paid) as total_revenue 
        FROM Payments p2 
        JOIN Tickets t2 ON p2.ticket_id = t2.ticket_id 
        GROUP BY t2.event_id
    ) AS avg_table
);

-- === 2. Attendees who booked multiple (more than 1) events ===
SELECT name 
FROM Attendens
WHERE attendee_id IN (
    SELECT attendee_id 
    FROM Tickets 
    GROUP BY attendee_id 
    HAVING COUNT(event_id) > 1
);

-- === 3. Organizers who managed more than 3 events ===
SELECT organizer_name 
FROM Organizers
WHERE organizer_id IN (
    SELECT organizer_id 
    FROM Events 
    GROUP BY organizer_id 
    HAVING COUNT(event_id) > 3
);

-- === 9. Implement Date & Time Functions ===

-- === 1. Extract the month from to analyze event trends ===
SELECT 
    event_name, 
    event_date, 
    MONTHNAME(event_date) AS event_month_name, -- Output: March, April...
    MONTH(event_date) AS event_month_number    -- Output: 3, 4...
FROM Events;

-- === 2. Calculate the number of days remaining for an upcoming event ===
SELECT 
    event_name, 
    event_date, 
    DATEDIFF(event_date, CURDATE()) AS days_remaining
FROM Events
WHERE event_date >= CURDATE(); -- Only for upcoming events

-- === 3. Format as YYYY-MM-DD HH:MM:SS ===
SELECT 
    payment_id, 
    payment_date, 
    DATE_FORMAT(payment_date, '%Y-%m-%d %H:%i:%s') AS formatted_payment_date
FROM Payments;

-- === 10. Use String Manipulation Functions ===

-- === 1. Convert all organizer names to uppercase ===
SELECT 
    organizer_id, 
    organizer_name, 
    UPPER(organizer_name) AS uppercase_name
FROM Organizers;

-- === 2. Remove extra spaces from attendee names using ===
SELECT 
    attendee_id, 
    name AS original_name, 
    TRIM(name) AS clean_name
FROM Attendens; -- Note: using your specific table name 'Attendens'

-- === 3. Replace NULL email fields with "Not Provided" ===
-- Checking in Attendens table
SELECT 
    name, 
    IFNULL(email, 'Not Provided') AS email_status
FROM Attendens;

-- Checking in Organizers table (just in case)
SELECT 
    organizer_name, 
    IFNULL(contact_email, 'Not Provided') AS email_status
FROM Organizers;

-- === 11. Implement Window Functions ===

-- === 1. Rank events based on total revenue earned ===
SELECT 
    e.event_name, 
    SUM(p.amount_paid) AS total_revenue,
    DENSE_RANK() OVER (ORDER BY SUM(p.amount_paid) DESC) AS revenue_rank
FROM Events e
JOIN Tickets t ON e.event_id = t.event_id
JOIN Payments p ON t.ticket_id = p.ticket_id
WHERE p.payment_status = 'Success'
GROUP BY e.event_id, e.event_name;

-- === 2. Display the cumulative sum of ticket sales ===
SELECT 
    e.event_name, 
    e.event_date,
    e.ticket_price,
    SUM(e.ticket_price) OVER (ORDER BY e.event_date) AS cumulative_ticket_sales
FROM Events e;

-- === 3. Show the running total of attendees registered per event ===
SELECT 
    t.event_id, 
    t.booking_date,
    COUNT(t.attendee_id) OVER (ORDER BY t.booking_date) AS running_total_attendees
FROM Tickets t
WHERE t.status = 'Confirmed';

-- === 12. Apply SQL CASE Expressions ===

-- === 1. Categorize events based on ticket sales ===
SELECT 
    event_name,
    total_seats,
    available_seats,
    CASE 
        WHEN available_seats < (0.20 * total_seats) THEN 'High Demand'
        WHEN available_seats BETWEEN (0.20 * total_seats) AND (0.50 * total_seats) THEN 'Moderate Demand'
        ELSE 'Low Demand'
    END AS demand_category
FROM Events;

-- === 2. Assign payment statuses ===
SELECT 
    payment_id,
    amount_paid,
    CASE 
        WHEN payment_status = 'Success' THEN 'Successful'
        WHEN payment_status = 'Failed' THEN 'Failed'
        ELSE 'Pending'
    END AS final_payment_status
FROM Payments;DROP DATABASE PRACTICAL;