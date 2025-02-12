# little scrippy to zip up this mod since Factorio wants a zip  
# speeds up in game testing by a lot 
import json, os, shutil

# TODO: update the version in the json.info after it makes the zip
#       place the zip in the factorio directory so the batch file can do it all with 1 click 
#       zip the folder instead of just the files (zip/folder/files)

# open the info.json in this mod and get the name & version from it 
def getModVersion() -> str:
    global modVersion
    with open("info.json") as file:
        modInfo = json.loads(file.read())
    modVersion = modInfo["version"]
    return modVersion

getModVersion()


def updateVersion() -> str:
    newVersion = int(modVersion[-1]) + 1
    global updatedVersion
    updatedVersion = modVersion.replace(modVersion[-1], str(newVersion))
    return updatedVersion

updateVersion()   


# get the name of the current folder from the file path and use the parent directory as the output for the zip 
def zipMod(folderPath):
    parentDir, currentFolder = os.path.split(folderPath)
    zipFileName = currentFolder + f"_{updatedVersion}"
    zipFilePath = os.path.join(parentDir, zipFileName)

    shutil.make_archive(zipFilePath, 'zip', folderPath)

# call zipMod() in the folder where this python script is 
zipMod(os.getcwd())