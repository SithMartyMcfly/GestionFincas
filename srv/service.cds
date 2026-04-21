using db from '../db/schema';

service CatalogService {

    // PROPIETARIOS
    entity DB_Propietarios as projection on db.Propietarios;

    // FINCAS
    entity DB_Fincas as projection on db.Fincas;

    // PROVEEDORES
    entity DB_Proveedores as projection on db.Proveedores;

    // SERVICIOS / INCIDENCIAS
    entity DB_Servicios as projection on db.Servicios;

}