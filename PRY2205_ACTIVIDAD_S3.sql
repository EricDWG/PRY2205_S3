PROMPT ============================================================
PROMPT =============== CASO 1: CLIENTES ===========================
PROMPT ============================================================

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE CLIENTES';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

-- Creamos la tabla CLIENTES
CREATE TABLE CLIENTES (
    rut_cliente VARCHAR2(10),
    nombre_cliente VARCHAR2(50),
    ciudad VARCHAR2(30)
);

-- Insertamos datos
INSERT INTO CLIENTES VALUES ('12345678', 'Juan Perez', 'Santiago');
INSERT INTO CLIENTES VALUES ('98765432', 'Maria Lopez', 'Valparaiso');
INSERT INTO CLIENTES VALUES ('45678912', 'Pedro Torres', 'Concepcion');
INSERT INTO CLIENTES VALUES ('11223344', 'Ana Ruiz', 'Antofagasta');

-- Consulta principal
SELECT 
    LPAD(rut_cliente, 10, '0') AS rut_cliente,
    nombre_cliente AS nombre,
    ciudad,
    CASE 
        WHEN UPPER(ciudad) = 'SANTIAGO' THEN 'Zona Central'
        WHEN UPPER(ciudad) = 'VALPARAISO' THEN 'Zona Costa'
        WHEN UPPER(ciudad) = 'CONCEPCION' THEN 'Zona Sur'
        ELSE 'Zona Norte'
    END AS zona_cliente
FROM CLIENTES
ORDER BY ciudad ASC;

PROMPT ---- CASO 1 COMPLETADO ------------------------------------
PROMPT ============================================================
PROMPT =============== CASO 2: FACTURAS ===========================
PROMPT ============================================================


BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE FACTURAS';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

-- Creamos la tabla FACTURAS
CREATE TABLE FACTURAS (
    rut_cliente VARCHAR2(10),
    nombre_cliente VARCHAR2(50),
    fecha_emision DATE,
    monto_neto NUMBER
);

-- Insertamos los datos
INSERT INTO FACTURAS VALUES ('12345678', 'Juan Perez', TO_DATE('2024-08-10','YYYY-MM-DD'), 45000);
INSERT INTO FACTURAS VALUES ('98765432', 'Maria Lopez', TO_DATE('2024-06-22','YYYY-MM-DD'), 85000);
INSERT INTO FACTURAS VALUES ('45678912', 'Pedro Torres', TO_DATE('2024-02-15','YYYY-MM-DD'), 120000);
INSERT INTO FACTURAS VALUES ('11223344', 'Ana Ruiz', TO_DATE('2024-11-05','YYYY-MM-DD'), 60000);

-- Consulta principal
SELECT
    LPAD(rut_cliente, 10, '0') AS rut_cliente,
    nombre_cliente AS nombre,
    TO_CHAR(fecha_emision, 'DD/MM/YYYY') AS fecha,
    TO_CHAR(monto_neto, '$99G999G990') AS monto,
    CASE 
        WHEN monto_neto BETWEEN 0 AND 50000 THEN 'Bajo'
        WHEN monto_neto BETWEEN 50001 AND 100000 THEN 'Medio'
        ELSE 'Alto'
    END AS rango_factura
FROM FACTURAS
ORDER BY fecha_emision DESC;

PROMPT ---- CASO 2 COMPLETADO ------------------------------------

PROMPT ============================================================
PROMPT =============== CASO 3: PRODUCTOS ==========================
PROMPT ============================================================

-- Eliminamos la tabla si ya existia
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE PRODUCTOS';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

-- Creamos la tabla
CREATE TABLE PRODUCTOS (
    cod_producto VARCHAR2(10),
    nombre_producto VARCHAR2(50),
    stock NUMBER,
    precio_unitario NUMBER
);

-- Datos
INSERT INTO PRODUCTOS VALUES ('P001', 'Zapato Deportivo', 20, 29990);
INSERT INTO PRODUCTOS VALUES ('P002', 'Zapato Formal', 75, 45990);
INSERT INTO PRODUCTOS VALUES ('P003', 'Zapatilla Urbana', 180, 55990);
INSERT INTO PRODUCTOS VALUES ('P004', 'Zapato Clasico', 0, 39990);

-- Consulta principal
SELECT
    cod_producto AS codigo,
    nombre_producto AS producto,
    stock,
    TO_CHAR(precio_unitario, '$99G999G990') AS precio,
    CASE 
        WHEN stock = 0 THEN 'Sin stock'
        WHEN stock BETWEEN 1 AND 50 THEN 'Stock bajo'
        WHEN stock BETWEEN 51 AND 200 THEN 'Stock medio'
        ELSE 'Stock alto'
    END AS nivel_stock
FROM PRODUCTOS
ORDER BY cod_producto DESC;

PROMPT ---- CASO 3 COMPLETADO ------------------------------------
PROMPT =================== FIN DEL SCRIPT ======================