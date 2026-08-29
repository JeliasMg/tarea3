# Autor: José Muñoz Gutiérrez
# Fecha: 2026-08-28
# Qué hace: Crea vectores de datos económicos de un grupo de trabajadores,
#           practica subsetting por posición y por condición

# Se simula un grupo de 8 trabajadores con salario nominal (miles de pesos),
# años de educación y edad. Los tres vectores describen a las mismas
# 8 personas, en el mismo orden, para poder cruzarlos entre sí más adelante.

salario <- c(850, 1200, 980, 1450, 760, 2100, 1330, 990) # salario nominal mensual
educ    <- c(12, 16, 14, 18, 11, 19, 17, 13)             # años de educación formal
edad    <- c(24, 35, 29, 41, 22, 45, 38, 27)             # edad en años

# Verificación de tipo y longitud: confirma que cada vector es numérico y que
# los tres tienen el mismo largo (8), lo cual es necesario para que las
# operaciones y comparaciones "elemento a elemento" tengan sentido.

class(salario)
class(educ)
class(edad)

length(salario)
length(educ)
length(edad)

# 2) Selección por posición

# Se usa indexación por posición para inspeccionar casos puntuales sin tener
# que recorrer todo el vector manualmente.

primer_salario   <- salario[1]                  # el primer trabajador de la lista
ultimos_tres     <- salario[6:8]                 # los 3 últimos (el vector tiene 8 elementos)
todos_menos_uno  <- salario[-1]                  # excluye al primer trabajador

# 3) Selección por condición

# Se define un umbral salarial y se filtra con una condición lógica en vez de
# por posición, porque lo relevante aquí es EL VALOR del salario, no dónde
# está ubicado el trabajador en el vector.

umbral <- 1000
sobre_umbral <- salario[salario > umbral]

# sum() sobre un vector lógico cuenta los TRUE (cuántos superan el umbral);
# mean() sobre el mismo vector lógico da directamente la proporción, porque
# TRUE/FALSE se tratan como 1/0.

n_sobre_umbral    <- sum(salario > umbral)
prop_sobre_umbral <- mean(salario > umbral)

# 4) Operación vectorizada: salario real

# Se asume un IPC de referencia (base 100) para deflactar el salario nominal.
# La división se aplica automáticamente elemento a elemento

ipc <- 108.5
salario_real <- salario / ipc * 100

salario_real



# 5) Estadísticas descriptivas

media_salario    <- mean(salario)
mediana_salario  <- median(salario)

media_salario
mediana_salario


# Interpretación:
# - mean: el salario promedio del grupo; es sensible a valores extremos
#   (el trabajador de 2100 lo empuja hacia arriba).
# - median: el salario "típico" (el del trabajador central); al ser menor
#   que la media, sugiere una distribución con cola hacia salarios altos.