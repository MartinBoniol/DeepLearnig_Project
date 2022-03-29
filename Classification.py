import os
import pathlib
import random

class SportPreProcessing:

  APPRENTISSAGE = 0.7
  VALIDATION = 0.15

  def __init__(self, folder: str) -> None:
        self.__folder = folder
        self.__bd = []
        for elt in os.listdir(folder):
            if os.path.isdir(folder + "\\" + elt):
                self.__bd.append(elt)

  def __countPage(self, uri: str) -> int:
        """Compter le nombre de page.
        str : chemin vers les images

        return : le nombre de page de la BD
        """
        nbFile = 0
        for path in pathlib.Path(uri).iterdir():
            if path.is_file():
                nbFile += 1

        return nbFile

  def partitionner(self) -> None:
        """Partitionne la base de donnée en 3 sets."""
        for name in self.__bd:
            uri = self.__folder + '/' + name
            nb = self.__countPage(uri)

            nb_apprentissage = int(self.APPRENTISSAGE * nb) + 1
            nb_validation = int((self.APPRENTISSAGE + self.VALIDATION)* nb) + 1

            image = [os.fspath(x) for x in pathlib.Path(uri).iterdir() if x.is_file()]
            random.shuffle(image)

            for im in image:
                page = im.split('\\')[-1]
                if image.index(im) <= nb_apprentissage:
                    os.rename(im, os.getcwd() + '\\Apprentissage\\' + page)
                elif  nb_apprentissage < image.index(im) and image.index(im) <= nb_validation:
                    os.rename(im, os.getcwd() + '\\Validation\\' + page)
                else:
                    os.rename(im, os.getcwd() + '\\Test\\' + page)

if __name__ == "__main__":
    pp = SportPreProcessing(os.getcwd() + "/Sport")
    pp.partitionner()
