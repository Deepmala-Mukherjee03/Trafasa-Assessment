CREATE DATABASE procurement_system;
USE procurement_system;

CREATE TABLE po_items(po_id varchar(20), item_code varchar(20), quantity_ordered int);
CREATE TABLE grn_items(grn_id varchar(20), po_id varchar(20), item_code varchar(20), quantity_received int);

INSERT INTO po_items VALUES
('PO-2024-001','LAPTOP', 20),
('PO-2024-001','MOUSE', 50),
('PO-2024-001','KEYBOARD', 35);

INSERT INTO grn_items VALUES
('GRN001','PO-2024-001','LAPTOP',10),
('GRN001','PO-2024-001','MOUSE',20),
('GRN001','PO-2024-001','KEYBOARD',15),

('GRN002','PO-2024-001','LAPTOP',10),
('GRN002','PO-2024-001','MOUSE',30),
('GRN002','PO-2024-001','KEYBOARD',20);

SELECT
    p.po_id,
    SUM(g.quantity_received) AS total_quantity_received
FROM po_items p
JOIN grn_items g
    ON p.po_id = g.po_id
    AND p.item_code = g.item_code
WHERE p.po_id = 'PO-2024-001'
GROUP BY p.po_id;