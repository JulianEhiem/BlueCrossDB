-- Select database to use
Use BlueCrossBloodBank;

-- variables:
    declare
        @blood_bank_id INT,
        @patient_id    INT
    Begin

-- Get the total volume of blood by blood type for all locations combined
select blood_type_id, sum(quantity_donated) as total_volume_all_locations from Donation
group by blood_type_id

-- Get the total volume of blood by blood type for a specific location
select blood_type_id, sum(quantity_donated) as total_volume from Donation
where blood_bank_id = @blood_bank_id
group by blood_type_id

-- Get the total volume of blood for a specific location
select sum(quantity_donated) as total_vol_all_types from Donation
where blood_bank_id = @blood_bank_id

-- Get the total volume of blood in testing
select sum(quantity_donated) as total_volume_testing from Donation
where donation_status = 1

-- Get the total volume of blood in storage
select sum(quantity_donated) as total_volume_storage from Donation
where donation_status = 2

-- Get the number of days since a patient's last donation
select datediff(day, last_donation_date, CONVERT (date, GETDATE())) days_since_last_donation from
    (select max(donation_date) last_donation_date from donation
     where patient_id = @patient_id) as last_date
end;