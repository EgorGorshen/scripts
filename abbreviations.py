import os
import json
import re


def replace_abbreviations_in_file(file_path, abbreviations):
    with open(file_path, 'r') as file:
        data = file.read()

    for abbrev, full in abbreviations.items():
        pattern = re.compile(r'\b' + abbrev + r'\b', re.IGNORECASE)
        data = pattern.sub(full, data)

    with open(file_path, 'w') as file:
        file.write(data)


def process_files_in_directory(directory, abbreviations):
    for subdir, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith('.md'):
                print(f"Processing {file}")
                replace_abbreviations_in_file(os.path.join(subdir, file), abbreviations)


def main():
    with open("/Users/gorsenkovegor/.scripts/abbreviations.json", 'r') as file:
        abbreviations = json.load(file)
    
    process_files_in_directory('.', abbreviations)


if __name__ == "__main__":
    main()

