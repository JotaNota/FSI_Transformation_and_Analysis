# Documentación del Proyecto FSI – Transformaciones en SQL Server

- ✔️ Dataset cargado y renombrado
- ✔️ Tabla `FSI_NORMALIZADO` creada
- ✔️ Encabezados traducidos
- ✔️ Campo `rank` transformado a entero
- ✔️ Columna `nivel` generada según rangos



## 📌 Cargar dataset y renombrar tabla original
- Renombrar la tabla `FSI_Raw$` a `FSI_RAW_` utilizando `sp_rename`

## 📌 Crear copia
- Crear la tabla `FSI_NORMALIZADO` usando `SELECT * INTO` desde `FSI_RAW_`

## 📌 Traducir encabezados
- Renombrar columnas de inglés a español usando `sp_rename`
- Separar:
  - Columnas sin espacios (identificadores válidos)
  - Columnas con espacios (requieren corchetes)

## 📌 Cambiar tipo de dato de columna `rank` (texto → entero)
- Agregar nueva columna `rank_num` tipo `INT`
- Extraer números de `rank` con `LEFT` y `PATINDEX`
- Convertir a entero con `TRY_CAST`
- Validar con `SELECT DISTINCT rank, rank_num`

## 📌 Reemplazar columna `rank`
- Eliminar columna original `rank` (tipo texto)
- Renombrar `rank_num` como `rank` (tipo entero)

## 📌 Crear columna `nivel` según `total_fsi`
- Agregar columna `nivel` tipo `NVARCHAR`
- Asignar valores según `total_fsi`:
  - `Bajo` para `≤ 40`
  - `Medio` para `≤ 80`
  - `Alto` para `> 80`
- Verificar distribución con `GROUP BY nivel`

## ✅ Estado actual
- Tabla `FSI_NORMALIZADO` limpia y normalizada
- Encabezados traducidos al español
- Columna `rank` en tipo numérico
- Columna `nivel` categorizada correctamente

## Próximos pasos