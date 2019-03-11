from io import StringIO


class ImageChar():
    def getBaseB64ImageStr(self):
        jpeg_image_buffer = StringIO.StringIO()
        self.image.save(jpeg_image_buffer, "jpeg")
        return jpeg_image_buffer.getvalue()