from  PIL import Image,ImageDraw, ImageFont
import random
import math, string
from io import BytesIO

class ImageChar():
    def __init__(self, fontColor=(0, 0, 0),
                 size=(100, 40),
                 fontPath='wqy.ttc',
                 bgColor=(255, 255, 255),
                 fontSize=20):
        self.size = size
        self.fontPath = fontPath
        self.bgColor = bgColor
        self.fontSize = fontSize
        self.fontColor = fontColor
        self.font = ImageFont.truetype(self.fontPath, self.fontSize)
        self.image = Image.new('RGB', size, bgColor)

    def rotate(self):
        self.image.rotate(random.randint(0, 30), expand=0)

    def drawText(self, pos, txt, fill):
        draw = ImageDraw.Draw(self.image)
        draw.text(pos, txt, font=self.font, fill=fill)
        del draw

    def randRGB(self):
        return (random.randint(0, 255),
                random.randint(0, 255),
                random.randint(0, 255))

    def randPoint(self):
        (width, height) = self.size
        return (random.randint(0, width), random.randint(0, height))

    def randLine(self, num):
        draw = ImageDraw.Draw(self.image)
        for i in range(0, num):
            draw.line([self.randPoint(), self.randPoint()], self.randRGB())
        del draw

    def getBaseB64ImageStr(self):
        jpeg_image_buffer = BytesIO()
        self.image.save(jpeg_image_buffer, "jpeg")
        return jpeg_image_buffer.getvalue()

    # def randChinese(self, num):
    #     gap = 5
    #     start = 0
    #     for i in range(0, num):
    #         char = RandomChar().GB2312()
    #         x = start + self.fontSize * i + random.randint(0, gap) + gap * i
    #         self.drawText((x, random.randint(-5, 5)), RandomChar().GB2312(), self.randRGB())
    #         self.rotate()
    #     self.randLine(18)

    def save(self, path):
        self.image.save(path)


if __name__ == '__main__':
    ic = ImageChar(fontColor=(100, 211, 90))
    ic.randChinese(4)
    ic.save("c:/1.png")