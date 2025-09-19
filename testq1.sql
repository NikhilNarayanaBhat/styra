select p.propertyname,categorypropertyallocationid,ct.categoryid,a.config from tblcategorypropertyallocation a
inner join tblproperties p on p.propertyid=a.propertyid
inner join tblcategories ct on ct.categoryid=a.categoryid
limit 10