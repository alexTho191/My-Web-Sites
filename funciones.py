import skimage.io as imgio

def cargar_imagen(ruta):
    """Carga una imagen desde una ruta especificada."""
    return imgio.imread(ruta)

# Ejemplo
imagen = cargar_imagen('imagen.jpg')
