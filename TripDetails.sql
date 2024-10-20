CREATE VIEW TripDetails AS
SELECT 
    t.trip_id, 
    v.vehicle_number, 
    d.name AS driver_name, 
    t.departure_time, 
    t.arrival_tipe 
FROM 
    Trips t
JOIN 
    Vehicles v ON t.vehicle_id = v.id
JOIN 
    Drivers d ON t.driver_id = d.driver_id;