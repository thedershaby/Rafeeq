
-- ---------------------------------------------------------
-- 1. USERS  (7 owners, 10 sitters, 1 admin = 18 rows)
-- ---------------------------------------------------------
INSERT INTO Users (user_id, Fname, Lname, Email, Hash_Password, Role) VALUES
(1,  'Mona',     'Farid',   'mona.farid@example.com',    'hash_ph_01', 'owner'),
(2,  'Youssef',  'Adel',    'youssef.adel@example.com',  'hash_ph_02', 'owner'),
(3,  'Hana',     'Kamal',   'hana.kamal@example.com',    'hash_ph_03', 'owner'),
(4,  'Omar',     'Said',    'omar.said@example.com',     'hash_ph_04', 'owner'),
(5,  'Laila',    'Fahmy',   'laila.fahmy@example.com',   'hash_ph_05', 'owner'),
(6,  'Tarek',    'Ezzat',   'tarek.ezzat@example.com',   'hash_ph_06', 'owner'),
(7,  'Dina',     'Rashad',  'dina.rashad@example.com',   'hash_ph_07', 'owner'),
(8,  'Salma',    'Nabil',   'salma.nabil@example.com',   'hash_ph_08', 'sitter'),
(9,  'Karim',    'Hassan',  'karim.hassan@example.com',  'hash_ph_09', 'sitter'),
(10, 'Nourhan',  'Tarek',   'nourhan.tarek@example.com', 'hash_ph_10', 'sitter'),
(11, 'Ahmed',    'Gaber',   'ahmed.gaber@example.com',   'hash_ph_11', 'sitter'),
(12, 'Yara',     'Sobhy',   'yara.sobhy@example.com',    'hash_ph_12', 'sitter'),
(13, 'Mahmoud',  'Ali',     'mahmoud.ali@example.com',   'hash_ph_13', 'sitter'),
(14, 'Rana',     'Wahid',   'rana.wahid@example.com',    'hash_ph_14', 'sitter'),
(15, 'Sherif',   'Naguib',  'sherif.naguib@example.com', 'hash_ph_15', 'sitter'),
(16, 'Aya',      'Mostafa', 'aya.mostafa@example.com',   'hash_ph_16', 'sitter'),
(17, 'Hossam',   'Zaki',    'hossam.zaki@example.com',   'hash_ph_17', 'sitter'),
(18, 'Admin',    'User',    'admin@animalin.eg',         'hash_ph_18', 'sitter');
-- (row 18 kept as 'sitter' since your Role check has no 'admin' option right now)

-- ---------------------------------------------------------
-- 2. SITTER_PROFILE  (10 rows, one per sitter: users 8-17)
-- ---------------------------------------------------------
INSERT INTO Sitter_Profile (SP_id, User_id, Bio, address, city, accepts_cats, accepts_dogs, accepts_birds, price_per_night, rating_avg) VALUES
(1,  8,  'Animal lover with 5 years experience.',        '12 Gamaat El Dowal St', 'Cairo',       1, 1, 0, 250, 4.80),
(2,  9,  'Vet student, comfortable with special needs.', '4 Corniche Road',       'Alexandria',  1, 1, 1, 300, 4.60),
(3,  10, 'Calm home, great for cats and birds.',         '9 Tahrir St',           'Giza',        1, 0, 1, 180, 4.90),
(4,  11, 'Big backyard, dogs only.',                     '3 Haram St',            'Giza',        0, 1, 0, 220, 4.50),
(5,  12, 'Quiet apartment, cats preferred.',              '18 Zamalek St',         'Cairo',       1, 0, 0, 200, 4.70),
(6,  13, 'Experienced with large dog breeds.',            '7 Smouha St',           'Alexandria',  0, 1, 0, 280, 4.40),
(7,  14, 'Loves all animals, flexible schedule.',         '22 Nasr City St',       'Cairo',       1, 1, 1, 260, 4.85),
(8,  15, 'Weekend sitter, small pets only.',              '5 Mansoura St',         'Mansoura',    1, 0, 1, 150, 4.30),
(9,  16, 'Professional groomer and sitter.',              '30 Mohandessin St',     'Cairo',       1, 1, 0, 320, 4.95),
(10, 17, 'New sitter, eager and reliable.',               '14 Sidi Gaber St',      'Alexandria',  1, 1, 0, 170, 4.20);

-- ---------------------------------------------------------
-- 3. PET  (10 rows, owned by users 1-7, some owners have 2)
-- ---------------------------------------------------------
INSERT INTO Pet (Pet_id, Owner_id, Name, Species, Breed, age, special_needs) VALUES
(1,  1, 'Simba',  'cat',  'Persian',          3, NULL),
(2,  1, 'Rocky',  'dog',  'Baladi Mix',       5, 'Daily joint supplement'),
(3,  2, 'Coco',   'bird', 'Cockatiel',        1, NULL),
(4,  2, 'Bella',  'dog',  'Golden Retriever', 2, NULL),
(5,  3, 'Mishmish','cat', 'Baladi',           4, NULL),
(6,  4, 'Max',    'dog',  'German Shepherd',  6, 'Hip dysplasia, needs soft bedding'),
(7,  5, 'Loulou', 'cat',  'Siamese',          2, NULL),
(8,  6, 'Kiwi',   'bird', 'Budgie',           1, NULL),
(9,  7, 'Tom',    'cat',  'Maine Coon',       3, NULL),
(10, 7, 'Zizo',   'dog',  'Poodle',           4, 'Grooming needed every 2 weeks');

-- ---------------------------------------------------------
-- 4. BOOKING  (10 rows, mixing pets/sitters, various statuses)
-- ---------------------------------------------------------
INSERT INTO Booking (Booking_id, SP_id, Pet_id, start_date, end_date, status, total_price) VALUES
(1,  3, 1,  '2026-08-01', '2026-08-05', 'completed', 720.00),
(2,  2, 2,  '2026-08-10', '2026-08-12', 'completed', 600.00),
(3,  1, 4,  '2026-09-01', '2026-09-04', 'confirmed', 750.00),
(4,  3, 3,  '2026-09-15', '2026-09-16', 'pending',   180.00),
(5,  6, 6,  '2026-08-20', '2026-08-23', 'completed', 840.00),
(6,  5, 7,  '2026-09-05', '2026-09-07', 'confirmed', 400.00),
(7,  9, 9,  '2026-08-25', '2026-08-27', 'completed', 640.00),
(8,  4, 10, '2026-09-10', '2026-09-12', 'confirmed', 440.00),
(9,  8, 8,  '2026-09-18', '2026-09-19', 'pending',   150.00),
(10, 10,5,  '2026-08-28', '2026-08-30', 'cancelled', 340.00);

-- ---------------------------------------------------------
-- 5. PAYMENT  (10 rows - one per booking above)
-- ---------------------------------------------------------
INSERT INTO Payment (payment_id, booking_id, amount, payment_method, payment_status, paid_at) VALUES
(1,  1,  720.00, 'card',   'paid',     '2026-07-30T10:15:00'),
(2,  2,  600.00, 'wallet', 'paid',     '2026-08-08T09:00:00'),
(3,  3,  750.00, 'card',   'paid',     '2026-08-29T14:20:00'),
(4,  4,  180.00, 'cash',   'pending',  NULL),
(5,  5,  840.00, 'card',   'paid',     '2026-08-18T11:00:00'),
(6,  6,  400.00, 'wallet', 'paid',     '2026-09-03T08:30:00'),
(7,  7,  640.00, 'card',   'paid',     '2026-08-23T16:45:00'),
(8,  8,  440.00, 'wallet', 'paid',     '2026-09-08T13:10:00'),
(9,  9,  150.00, 'cash',   'pending',  NULL),
(10, 10, 340.00, 'card',   'refunded', '2026-08-27T09:00:00');

-- ---------------------------------------------------------
-- 6. REVIEW  (10 rows - one per booking; skip statuses that
--    wouldn't realistically have a review yet, using bookings
--    that are completed/confirmed/cancelled all having fed
--    back for seed-data completeness)
-- ---------------------------------------------------------
INSERT INTO Review (review_id, booking_id, rating, comment) VALUES
(1,  1,  5, 'Amazing care for Simba, sent photos every day!'),
(2,  2,  4, 'Karim was great with Rocky, would book again.'),
(3,  3,  5, 'Bella loved her stay, very clean home.'),
(4,  4,  4, 'Good communication throughout.'),
(5,  5,  5, 'Max was well looked after, thank you!'),
(6,  6,  3, 'Decent, but a bit slow to reply.'),
(7,  7,  5, 'Tom came back happy and healthy.'),
(8,  8,  4, 'Zizo got groomed as promised, nice touch.'),
(9,  9,  4, 'Kiwi was safe and sound.'),
(10, 10, 2, 'Booking was cancelled last minute, refund handled fine though.');