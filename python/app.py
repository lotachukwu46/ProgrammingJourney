from pathlib import Path

path = Path("./ProgrammingJourney/python")

for file in path.glob('*'):
    print(file)