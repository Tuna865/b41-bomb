import json, os, sys, getopt
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

# need to update info.json before this will work so I'll just manually increment version for now

# def updateVersion() -> str:
#     newVersion = int(modVersion[-1]) + 1
#     global updatedVersion
#     updatedVersion = modVersion.replace(modVersion[-1], str(newVersion))
#     # print(f"\n\t{updatedVersion}")
#     return updatedVersion
# updateVersion()   

zipName = f"{modName}_{modVersion}.zip"
modPath = os.getcwd()

def zipMod(zip_file_path, root_dir):
    with ZipFile(zip_file_path, 'w') as zip:
        for root, _, files in os.walk(root_dir):
            for file in files:
                file_path = os.path.join(root, file)
                archive_path = os.path.relpath(file_path, root_dir)
                zip.write(file_path, os.path.join(os.path.basename(root_dir), archive_path))

zipMod(zipName, modPath)


# TODO: update the version in info.json after creating the zip
#       place the zip in the Factorio directory instead of here


# if not os.path.exists(zipName):
#     print("creating mod")
#     zipMod(zipName, modPath)
# else:
#     # need logic here to move or copy the zip to the Factorio mods folder 
#     print("mod already exists; zip folder placed in Factorio mods folder (work in progress; not yet)")

# adds the ability for the batch file to put the zip in Factorio's mod directory
"""
if __name__ == "__main__":
  factorioFolderDir = None
  opts, args = getopt.getopt(sys.argv[1:], ":m:", ['factoriodir='])
  for opt, arg in opts:
    if opt in ('-m', '--factoriodir'):
      factorioFolderDir = os.path.realpath(arg.strip())
"""