select a.model,b.brand,cp.company,c.date_purchase,c.license_plate,cl.color,c.km_total, c.id_policy, i.insurance_company

from andreina_garcia_boggiano.cars c inner join andreina_garcia_boggiano.models a 
on a.id_model  = c.id_model 
inner join andreina_garcia_boggiano.brands b 
on b.id_brand = a.id_brand 
inner join andreina_garcia_boggiano.colors cl 
on cl.id_color = c.id_color 
inner join andreina_garcia_boggiano.companies cp 
on cp.id_company = b.id_company 
inner join andreina_garcia_boggiano.insurancecompanies i 
on i.id_insurance_company  = c.id_insurance_company 