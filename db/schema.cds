namespace db;

// ==========================
//   PROPIETARIOS
// ==========================
entity Propietarios {
  key NIF        : String(50);
  NOMBRE         : String(100);
  DIRECCION      : String(200);
  TELEFONO       : String(20);
  PRESIDENTE     : Boolean;
}

// ==========================
//   FINCAS
// ==========================
entity Fincas {
  key CIF         : String(50);
  DIRECCION       : String(200);
  LOCALIDAD       : String(100);
  TIPO            : TipoFinca;

  PRESIDENTE_NIF : String(50);
  presidente     : Association to Propietarios
                     on presidente.NIF = PRESIDENTE_NIF;
}

// ==========================
//   PROVEEDORES
// ==========================
entity Proveedores {
  key CIF        : String(50);
  NOMBRE         : String(100);
  TIPO           : TipoGremio;
  TELEFONO       : String(20);

  CIF_finca      : String(50);
  finca          : Association to Fincas
                     on finca.CIF = CIF_finca;
}

// ==========================
//   SERVICIOS / INCIDENCIAS
// ==========================
entity Servicios {
  key ID          : Integer;
  TIPO            : TipoServicio;
  DESCRIPCION     : String(200);
  FECHA           : Timestamp @cds.on.insert: $now;
  COSTE           : Decimal(10,2);
  ESTADO          : status;
  CIF_finca       : String(50);
  NIF_usuario     : String(50);
  CIF_proveedor   : String(50);

  finca           : Association to Fincas
                      on finca.CIF = CIF_finca;

  propietario     : Association to Propietarios
                      on propietario.NIF = NIF_usuario;

  proveedor       : Association to Proveedores
                      on proveedor.CIF = CIF_proveedor;
}

// ==========================
//   ENUMS
// ==========================
type TipoServicio : String enum {
    INCIDENCIA;
    PERIODICO;
}

type TipoGremio : String enum {
    FONTANERIA;
    ELECTRICIDAD;
    JARDINERIA;
    LIMPIEZA;
    OBRA;
    OTROS;
}

type TipoFinca : String enum{
    PISOS;
    CASAS;
    RURAL;
    COMERCIOS;
}

type status : String enum {
    ABIERTO;
    PENDIENTE;
    TRABAJANDO;
    FINALIZADO;
}