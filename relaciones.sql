-- Relaciones entre tablas


-- Un usuario puede poseer multiples comentarios
-- Un comentario le pertenece a un usuario


-- Comments
CREATE TABLE comments(
    id INT AUTO_INCREMENT PRIMARY KEY,  -- unico
    tittle VARCHAR(50),
    user_id INT,    -- llave foranea (columna que almacena la key de una tabla externa)
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);