# NetMax

## Nodos de distribución

|Núm nodo | Características | Nombre Global del PDB | Sufijo para fragmentos
|--|--|--|--|
| 1 | <ul><li>Servidor con capacidad de procesamiento y memoria limitados. </li></ul>| jccbdd_s1.fi.unam | JCC_S1 |
| 2 | <ul><li>Servidor con grandes capacidades de procesamiento, memoria y alta disponibilidad. </li></ul>| jccbdd_s1.fi.unam | JCC_S2 |
| 3 | <ul><li>Servidor con software especializado para editar videos enfocados al aprendizaje y a la educación. </li><li>Su capacidad de procesamiento y memoria se considera como medio</li><li>Cuenta con licencias y herramientas de seguridad que permiten cifrar y proteger datos delicados o sensibles.</li></ul>| sgsbdd_s1.fi.unam | SGS_S1 |
| 4 | <ul><li>Servidor con gran capacidad de almacenamiento, en especial para realizar el tratamiento de datos estáticos o históricos que ya no sufren actualizaciones.</li></ul>| sgsbdd_s2.fi.unam | SGS_S2 |

## Esquema de Fragmentación

| Nombre del fragmento/Tabla | Expresión algebraica |
|:--:|:--:|
| USUARIO_F1_SGS_S1| $ \pi_{usuario\_id, num\_tarjeta, password}($ USUARIO $)$ | 
| USUARIO_F2	| $\pi_{usuario\_id,email, nombre, ap\_paterno, ap\_materno, fecha\_ingreso, fecha\_fin\_cuenta, vigente, tipo\_cuenta\_id}($ USUARIO $)$ |
| USUARIO_F2_SGS_S2| $\sigma_{vigente = '0'}($ USUARIO_F2 $)$ |
| USUARIO_F3_JCC_S1| $\sigma_{tipo\_cuenta\_id = '1'\space and \space vigente = '1'}($ USUARIO_F2 $)$ |
| USUARIO_F4_SGS_S1| $\sigma_{tipo\_cuenta\_id = '2'\space and \space vigente = '1'}($ USUARIO_F2 $)$ | 
| USUARIO_F5_JCC_S2| $\sigma_{tipo\_cuenta\_id = '3'\space and \space vigente = '1'}($ USUARIO_F2 $)$ | 
| PROGRAMA_F1_JCC_1 | $\sigma_{substr(folio, 1, 2) \space between \space 'AA' \space and \space'MZ' }($ PROGRAMA $)$ | 
| PROGRAMA_F2 | $\sigma_{substr(folio, 1, 2) \space between \space 'NA' \space and \space 'ZZ' }($ PROGRAMA $)$ | 
| PROGRAMA_F2_SGS_S1 | $\sigma_{status\_id \space in (1, 2, 3) }($ PROGRAMA\_F2 $)$ | 
| PROGRAMA_F3_SGS_S2 | $\sigma_{status\_id \space in (4, 5) }($ PROGRAMA\_F2 $)$ | 
| DOCUMENTAL_F1_JCC_S1 | DOCUMENTAL $⋉_{programa\_id} ($ PROGRAMA_F1_JCC_S1 $)$ | 
| DOCUMENTAL_F2_SGS_S1 | DOCUMENTAL $⋉_{programa\_id} ($ PROGRAMA_F2_SGS_S1 $)$ | 
| DOCUMENTAL_F3_SGS_S2 | DOCUMENTAL $⋉_{programa\_id} ($ PROGRAMA_F3_SGS_S2 $)$ | 
| PELICULA_F1_JCC_S1 | PELICULA $⋉_{programa\_id} ($ PROGRAMA_F1_JCC_S1 $)$ | 
| PELICULA_F2_SGS_S1 | PELICULA $⋉_{programa\_id} ($ PROGRAMA_F2_SGS_S1 $)$ | 
| PELICULA_F3_SGS_S2 | PELICULA $⋉_{programa\_id} ($ PROGRAMA_F3_SGS_S2 $)$ | 
| SERIE_F1_JCC_S1 | SERIE $⋉_{programa\_id} ($ PROGRAMA_F1_JCC_S1 $)$ | 
| SERIE_F2_SGS_S1 | SERIE $⋉_{programa\_id} ($ PROGRAMA_F2_SGS_S1 $)$ | 
| SERIE_F3_SGS_S2 | SERIE $⋉_{programa\_id} ($ PROGRAMA_F3_SGS_S2 $)$ | 
| HISTORICO_STATUS_PROGRAMA_SGS_S2|$\sigma($ HISTORICO_STATUS_PROGRAMA_SGS_S1 $)$ | 
| ARCHIVO_PROGRAMA_F1_JCC_S2 | $\sigma_{tamanio > 10}($ ARCHIVO_PROGRAMA $)$ | 
| ARCHIVO_PROGRAMA_F2_SGS_S1 | $\sigma_{tamanio <= 10}($ ARCHIVO_PROGRAMA $)$ | 
| PLAYLIST_F1_SGS_S2 | PLAYLIST $⋉_{usuario\_id} ($ USUARIO_F2_SGS_S2 $)$ | 
| PLAYLIST_F2_JCC_S1 | PLAYLIST $⋉_{usuario\_id} ($ USUARIO_F3_JCC_S1 $)$ | 
| PLAYLIST_F3_SGS_S1 | PLAYLIST $⋉_{usuario\_id} ($ USUARIO_F4_SGS_S1 $)$ | 
| PLAYLIST_F4_JCC_S2 | PLAYLIST $⋉_{usuario\_id} ($ USUARIO_F5_JCC_S2 $)$ | 
| STATUS_PROGRAMA | Copia Manual |
| TIPO_CUENTA_R_JCC_S1 | Tabla Replicada |
| TIPO_CUENTA_R_JCC_S2 | Tabla Replicada |
| TIPO_CUENTA_R_SGS_S1 | Tabla Replicada |
| TIPO_CUENTA_R_SGS_S2 | Tabla Replicada |
| PAIS_R_JCC_S1 | Tabla Replicada |
| PAIS_R_JCC_S2 | Tabla Replicada |
| PAIS_R_SGS_S1 | Tabla Replicada |
| PAIS_R_SGS_S2 | Tabla Replicada |
| TIPO_SERIE_R_JCC_S1 | Tabla Replicada |
| TIPO_SERIE_R_JCC_S2 | Tabla Replicada |
| TIPO_SERIE_R_SGS_S1 | Tabla Replicada |
| TIPO_SERIE_R_SGS_S2 | Tabla Replicada |