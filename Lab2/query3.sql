SELECT c.name, st.store_id,c.address
FROM Customers c, Stores st
WHERE c.name = st.manager;