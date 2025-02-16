import json, os
from zipfile import ZipFile

# open the info.json in this mod and get the name & version from it 
def getModInfo() -> str:
    global modVersion, modName
    with open("info.json") as file:
        modInfo = json.loads(file.read())
    modVersion = modInfo["version"]
    modName = modInfo["name"]
    file.close()
    return modVersion, modName
getModInfo()

# need to update info.json before this will work 

# def updateVersion() -> str:
#     newVersion = int(modVersion[-1]) + 1
#     global updatedVersion
#     updatedVersion = modVersion.replace(modVersion[-1], str(newVersion))
#     # print(f"\n\t{updatedVersion}")
#     return updatedVersion
# updateVersion()   


# add the standard data and info files along w prototypes folder to the zip
def zipMod(zip_file_path, root_dir):
    with ZipFile(zip_file_path, 'w') as zip:
        for root, _, files in os.walk(root_dir):
            for file in files:
                file_path = os.path.join(root, file)
                # file_path = "C:/Development/Modding"
                archive_path = os.path.relpath(file_path, root_dir)
                zip.write(file_path, os.path.join(os.path.basename(root_dir), archive_path))
                

zipName = f"{modName}_{modVersion}.zip"
modPath = os.getcwd()
zipMod(zipName, modPath)

# TODO: update the version in info.json after creating the zip
#       place the zip in the Factorio directory instead of here