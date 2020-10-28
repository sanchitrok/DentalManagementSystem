/*Trigger to insert treatment cost for the patients to update new treatment cost*/
Delimiter $$
CREATE TRIGGER trgai
AFTER INSERT
ON treatment_catalog
FOR EACH ROW
BEGIN
    UPDATE treatment
	SET treatment_cost = treatment_cost + new.treatment_cost
    WHERE treatment_name = new.treatment_name;
END;
Delimiter;

SET FOREIGN_KEY_CHECKS=0;

Insert into treatment values(0,8,'Gum Surgery');
Insert into treatment_catalog values ('Gum Surgery',8900);

select * from treatment_catalog;
select * from treatment;


/*Trigger to delete treatment cost for the patients to update new treatment cost*/
Delimiter $$
CREATE TRIGGER trgdi
AFTER DELETE
ON treatment_catalog
FOR EACH ROW
BEGIN
    UPDATE treatment
	SET treatment_cost = treatment_cost - OLD.treatment_cost
    WHERE treatment_name = OLD.treatment_name;
END;
Delimiter;

DELETE from treatment_catalog where treatment_name = 'Cleaning';
select * from treatment_catalog;
select * from treatment;
