CREATE VIEW SupplierGoods AS
SELECT 
    s.supplier_id, 
    s.goods, 
    s.contact_info, 
    s.address, 
    dg.type AS good_type, 
    dg.count 
FROM 
    Suppliers s
JOIN 
    DeliveredGoods dg ON s.supplier_id = dg.supplier_id;