select count(1) as Total_Patients from `hospital er`;

select extract(year from date)as year , count(1) as Total_Patients from `hospital er`
group by extract(year from date);

select patient_age,
case
when patient_age<=10 then '0-10'
when patient_age<=20 then '11-20'
when patient_age<=30 then '21-30'
when patient_age<=40 then '31-40'
when patient_age<=50 then '41-50'
when patient_age<=60 then '51-60'
else '70+'
end  Age_buckets
from `hospital er`;

Select avg(coalesce(patient_sat_score,0)) as Avg_satisfaction_score from`hospital er`;

Select round(avg(patient_waittime),2) as Avg_patient_waittime from`hospital er`;

select round(sum(patient_admin_flag='TRUE')/count(*),2) *100 as '%Administrative_schedule'
from `hospital er`;

select sum(patient_admin_flag='FALSE')/count(*)*100 as '%Non_Administrative_schedule'
from `hospital er`;

select round(sum(patient_gender='M')/count(*),2)*100 as '%Male_patients'
from `hospital er`;

select round(sum(patient_gender='F')/count(*),2)*100 as '%FeMale_patients'
from `hospital er`;

select distinct(patient_race),round(avg(patient_waittime),2) as waittime from`hospital er`
group by patient_race           












