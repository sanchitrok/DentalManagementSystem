/*View for finding price of supplies*/
Create view supp as 
select supplies_name,no_of_units,cost_of_each_unit,no_of_units*cost_of_each_unit as total,location_id,supply_id
from supplies;