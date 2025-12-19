use ihcl_dbms;
CREATE TABLE hotel (
    hotel_id INT AUTO_INCREMENT PRIMARY KEY,
    hotel_name VARCHAR(30),
    city VARCHAR(20),
    state VARCHAR(20),
    total_rooms INT
);
CREATE TABLE room (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    hotel_id INT,
    room_type VARCHAR(10),
    price_per_night DECIMAL(8,2),
    room_status VARCHAR(10),
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id)
);
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(40),
    phone VARCHAR(15),
    email VARCHAR(50)
);
CREATE TABLE booking (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    hotel_id INT,
    room_id INT,
    check_in DATE,
    check_out DATE,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id),
    FOREIGN KEY (room_id) REFERENCES room(room_id)
);
CREATE TABLE payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT,
    amount DECIMAL(10,2),
    payment_mode VARCHAR(30),
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id)
);
CREATE TABLE employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    hotel_id INT,
    employee_name VARCHAR(40),
    department VARCHAR(40),
    salary DECIMAL(10,2),
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id)
);
INSERT INTO hotel (hotel_name, city, state, total_rooms)
VALUES 
('Taj Palace', 'Delhi', 'Delhi', 350),
('Taj Mahal Hotel', 'Mumbai', 'Maharashtra', 280);

INSERT INTO room (hotel_id, room_type, price_per_night, room_status)
VALUES
(1, 'Deluxe', 8000, 'Available'),
(1, 'Suite', 15000, 'Occupied'),
(2, 'Deluxe', 7500, 'Available');

INSERT INTO customer (customer_name, phone, email)
VALUES
('Amit Sharma', '9876543210', 'amit@gmail.com'),
('Neha Verma', '9123456780', 'neha@gmail.com');

INSERT INTO booking (customer_id, hotel_id, room_id, check_in, check_out)
VALUES
(1, 1, 1, '2025-01-10', '2025-01-12'),
(2, 2, 3, '2025-01-15', '2025-01-18');

INSERT INTO payment (booking_id, amount, payment_mode)
VALUES
(1, 16000, 'Card'),
(2, 22500, 'UPI');

INSERT INTO employee (hotel_id, employee_name, department, salary)
VALUES
(1, 'Rajesh Kumar', 'Front Office', 35000),
(2, 'Pooja Singh', 'Housekeeping', 28000);

